import 'dart:async';
import 'dart:convert';
import 'dart:math' show Random;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../custom/helper.dart';
import '../../data/boxes.dart';
import '../../generated/l10n.dart';
import '../../models/cart/cart_base.dart';
import '../../models/entities/address.dart';
import '../../screens/common/google_map_mixin.dart';

class Uuid {
  final Random _random = Random();

  String generateV4() {
    var special = 8 + _random.nextInt(4);
    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}

class LocationResult {
  String? name;
  String? locality;
  LatLng? latLng;
  String? street;
  String? country;
  String? state;
  String? city;
  String? zip;
  String? apartment;
}

class AutoCompleteItem {
  String? id;
  String? text;
  int? offset;
  int? length;
}

class PlacePicker extends StatefulWidget {
  final String? apiKey;
  final Future<void> Function(BuildContext context, dynamic result)? onPop;

  const PlacePicker(this.apiKey, {this.onPop});

  @override
  State<StatefulWidget> createState() => PlacePickerState();
}

class PlacePickerState extends State<PlacePicker> with GoogleMapMixin {
  var isFetchingLocation = false;
  List<Address?> listAddress = [];
  Address? remoteAddress;
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  static const LatLng initialTarget = LatLng(33.93924, -84.12316);
  final Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = {
    const Marker(
      position: initialTarget,
      markerId: MarkerId('selected-location'),
    ),
  };

  LocationResult? locationResult;
  OverlayEntry? overlayEntry;
  String sessionToken = Uuid().generateV4();
  GlobalKey appBarKey = GlobalKey();
  bool hasSearchTerm = false;
  bool isByCurrentLocation = false;
  String previousSearchTerm = '';
  bool isMapVisible = false;

  void getDataFromLocal() {
    var listData = List<Address>.from(UserBox().addresses);
    final indexRemote =
        listData.indexWhere((element) => element.isShow == false);
    if (indexRemote != -1) {
      remoteAddress = listData[indexRemote];
    }

    listData.removeWhere((element) => element.isShow == false);
    listAddress = listData;
    setState(() {});
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    setMapStyle(mapController.future);
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  void initState() {
    getDataFromLocal();
    super.initState();
  }

  void removeData(int index, Address addressRemove) {
    var data = UserBox().addresses;
    if (data.isNotEmpty) {
      final indexWhere =
          data.indexWhere((element) => element.compareFullInfo(addressRemove));

      if (indexWhere != -1) {
        if (remoteAddress?.compareFullInfo(data[indexWhere]) ?? false) {
          data[indexWhere].isShow = false;
        } else {
          data.removeAt(indexWhere);
        }

        UserBox().addresses = data;
      }
    }
    getDataFromLocal();
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this address?',style: TextStyle(fontSize: 16),),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                removeData(index, listAddress[index]!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    InputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black),
    );
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    (Navigator.canPop(context)
                        ? IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ))
                        : const SizedBox.shrink()),
                    const Text(
                      'Choose address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: SearchInput(searchPlace),
            ),
            if (!hasSearchTerm && !isByCurrentLocation)
              Expanded(
                child: Column(
                  children: [
                    (isFetchingLocation)
                        ? const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()),
                            ),
                          )
                        : TextButton(
                            onPressed: () async {
                              setState(() {
                                isFetchingLocation = true;
                              });
                              var latLng = await Helper.getCurrentLocation();

                              if (latLng != null) {
                                setState(() {
                                  isFetchingLocation = false;
                                  isByCurrentLocation = true;
                                  isMapVisible = true;
                                });
                                moveToLocation(latLng);
                              } else {
                                setState(() {
                                  isFetchingLocation = false;
                                });
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 12, right: 10,top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.location_fill,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Use Current Location',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ListView.builder(
                            itemCount: listAddress.length,
                            itemBuilder: (context, index) {
                              return MaterialButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .setAddress(listAddress[index]);
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                     RadioButton(
                                      isActive: (Provider.of<CartModel>(context)
                                          .address
                                          ?.street ==
                                          listAddress[index]
                                              ?.street),
                                      radius: 10,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "${listAddress[index]?.street ?? ''}, ${listAddress[index]?.apartment ?? ''}",
                                          style: TextStyle(
                                              fontWeight:
                                                  (Provider.of<CartModel>(context)
                                                              .address
                                                              ?.street ==
                                                          listAddress[index]
                                                              ?.street)
                                                      ? FontWeight.bold
                                                      : null),
                                        ),
                                        subtitle: Text(
                                          '${listAddress[index]?.country ?? ''}, ${listAddress[index]?.state ?? ''} ${listAddress[index]?.zipCode ?? ''}'
                                        ),
                                      ),
                                    ),
                                    (Provider.of<CartModel>(context)
                                        .address
                                        ?.street !=
                                        listAddress[index]
                                            ?.street)
                                        ?
                                    IconButton(
                                        onPressed: () {
                                          if (listAddress[index] != null) {
                                            _showDeleteConfirmationDialog(context, index);
                                          }
                                        },
                                        icon: const Icon(Icons.delete))
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )
            else
              Flexible(
                child: Column(
                  children: [
                    Expanded(
                      flex: isMapVisible ? 2 : 0,
                      child: Visibility(
                        visible: isMapVisible,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                // Radius for the rounded edges
                                child: GoogleMap(
                                  buildingsEnabled: false,
                                  mapToolbarEnabled: false,
                                  initialCameraPosition: const CameraPosition(
                                    target: initialTarget,
                                    zoom: 15,
                                  ),
                                  myLocationButtonEnabled: true,
                                  myLocationEnabled: true,
                                  onMapCreated: onMapCreated,
                                  onTap: (latLng) {
                                    // clearOverlay();
                                    // moveToLocation(latLng);
                                  },
                                  markers: markers,
                                  gestureRecognizers: const <Factory<
                                      OneSequenceGestureRecognizer>>{},
                                  zoomGesturesEnabled: false,
                                  scrollGesturesEnabled: false,
                                  rotateGesturesEnabled: false,
                                  tiltGesturesEnabled: false,
                                ))),
                      ),
                    ),
                    if (locationResult != null) ...[
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Form(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: Column(
                                children: [
                                  TextFormField(
                                    enabled: false,
                                    controller: _streetAddressController,
                                    style: const TextStyle(color: Colors.black),
                                    // Text color
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .black),
                                      ),
                                      labelText: 'Street Address',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _apartmentController,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: borderStyle.copyWith(
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: .1)),
                                      focusedBorder: borderStyle,
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      labelText: 'Apt. floor, suite, etc',
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          enabled: false,
                                          controller: _zipCodeController,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          // Text color
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: borderStyle,
                                            focusedBorder: borderStyle,
                                            floatingLabelBehavior: FloatingLabelBehavior.never,
                                            labelText: 'Zip Code',
                                            labelStyle: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          enabled: false,
                                          controller: _countryController,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          // Text color
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            border: InputBorder.none,
                                            labelText: 'Country',
                                            floatingLabelBehavior: FloatingLabelBehavior.never,
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            locationResult?.apartment =
                                _apartmentController.text;

                            if (widget.onPop != null) {
                              widget.onPop!(context, locationResult);
                            } else {
                              Navigator.of(context).pop(locationResult);
                            }
                          },
                          backgroundColor: Colors.green,
                          label: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Center(
                                  child: Text(
                                'Save Address',
                                style: TextStyle(color: Colors.white),
                              ))),
                        ),
                      ),
                    ],
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  void clearOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void searchPlace(String place) {
    if (place == previousSearchTerm) return;
    previousSearchTerm = place;

    clearOverlay();
    setState(() {
      hasSearchTerm = place.isNotEmpty;
    });

    if (place.isEmpty) return;

    overlayEntry = OverlayEntry(
      builder: (context) => const Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );

    Overlay.of(context).insert(overlayEntry!);
    autoCompleteSearch(context, place);
  }

  void autoCompleteSearch(BuildContext context, String place) {
    place = place.replaceAll(' ', '+');
    var endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?'
        'key=${widget.apiKey}&input={$place}&sessiontoken=$sessionToken';

    if (locationResult != null) {
      endpoint +=
          '&location=${locationResult!.latLng!.latitude},${locationResult!.latLng!.longitude}';
    }

    http.get(Uri.parse(endpoint)).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        var suggestions = <RichSuggestion>[];

        if (data['error_message'] == null) {
          List<dynamic> predictions = data['predictions'];

          if (predictions.isEmpty) {
            suggestions.add(RichSuggestion(
                AutoCompleteItem()..text = S.of(context).noResultFound, () {}));
          } else {
            for (var t in predictions) {
              var aci = AutoCompleteItem()
                ..id = t['place_id']
                ..text = t['description']
                ..offset = t['matched_substrings'][0]['offset']
                ..length = t['matched_substrings'][0]['length'];
              suggestions.add(RichSuggestion(aci, () {
                FocusScope.of(context).requestFocus(FocusNode());
                decodeAndSelectPlace(aci.id);
              }));
            }
          }
        } else {
          suggestions.add(RichSuggestion(
              AutoCompleteItem()..text = data['error_message'], () {}));
        }

        displayAutoCompleteSuggestions(suggestions);
      }
    }).catchError((e) {});
  }

  void decodeAndSelectPlace(String? placeId) {
    clearOverlay();

    var endpoint =
        'https://maps.googleapis.com/maps/api/place/details/json?key=${widget.apiKey}&placeid=$placeId';

    http.get(Uri.parse(endpoint)).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        var location = data['result']['geometry']['location'];
        var latLng = LatLng(location['lat'], location['lng']);

        setState(() {
          isMapVisible = true;
        });

        moveToLocation(latLng);
      }
    });
  }

  void displayAutoCompleteSuggestions(List<RichSuggestion> suggestions) {
    clearOverlay();

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 155,
        bottom: 60,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          color: Theme.of(context).colorScheme.background,
          child: Column(children: suggestions),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void moveToLocation(LatLng latLng) {
    updateMapLocation(latLng);

    setState(() {
      locationResult = LocationResult()..latLng = latLng;
      markers.clear();
      markers.add(Marker(
        position: latLng,
        markerId: const MarkerId('selected-location'),
      ));
    });

    getAddress(latLng);
  }

  void updateMapLocation(LatLng latLng) {
    mapController.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  void getAddress(LatLng latLng) {
    var endpoint =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=${widget.apiKey}';
    http.get(Uri.parse(endpoint)).then((response) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          responseJson['results'] is List &&
          List.from(responseJson['results']).isNotEmpty) {
        String? road = '';
        String? locality = '';
        String? number = '';
        String? street = '';
        String? state = '';
        String? city = '';
        String? country = '';
        String? zip = '';

        List components = responseJson['results'][0]['address_components'];
        for (var item in components) {
          List types = item['types'];
          if (types.contains('street_number') ||
              types.contains('premise') ||
              types.contains('sublocality') ||
              types.contains('sublocality_level_2')) {
            if (number!.isEmpty) number = item['long_name'];
          }
          if (types.contains('route') || types.contains('neighborhood')) {
            if (street!.isEmpty) street = item['long_name'];
          }
          if (types.contains('administrative_area_level_1'))
            state = item['short_name'];
          if (types.contains('administrative_area_level_2') ||
              types.contains('administrative_area_level_3')) {
            if (city!.isEmpty) city = item['long_name'];
          }
          if (types.contains('locality')) {
            if (locality!.isEmpty) locality = item['short_name'];
          }
          if (types.contains('route')) {
            if (road!.isEmpty) road = item['long_name'];
          }
          if (types.contains('country')) country = item['short_name'];
          if (types.contains('postal_code')) {
            if (zip!.isEmpty) zip = item['long_name'];
          }
        }

        setState(() {
          locationResult = LocationResult()
            ..name = road
            ..locality = locality
            ..latLng = latLng
            ..street = '$number $street'
            ..state = state
            ..city = city
            ..country = country
            ..zip = zip;

          _streetAddressController.text = locationResult?.street ?? '';
          _zipCodeController.text = locationResult?.zip ?? '';
          _apartmentController.text = locationResult?.apartment ?? '';
          _countryController.text = locationResult?.country ?? '';
        });
      } else {
        setState(() {
          locationResult = LocationResult()
            ..name = ''
            ..latLng = latLng
            ..street = ''
            ..state = ''
            ..city = ''
            ..country = ''
            ..zip = ''
            ..apartment = '';
        });
      }
    });
  }
}

class RichSuggestion extends StatelessWidget {
  final VoidCallback onTap;
  final AutoCompleteItem autoCompleteItem;

  const RichSuggestion(this.autoCompleteItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RichText(
                text: TextSpan(children: getStyledTexts(context)),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<TextSpan> getStyledTexts(BuildContext context) {
    final result = <TextSpan>[];

    final startText =
        autoCompleteItem.text!.substring(0, autoCompleteItem.offset);
    if (startText.isNotEmpty) {
      result.add(
        TextSpan(
          text: startText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      );
    }

    final boldText = autoCompleteItem.text!.substring(autoCompleteItem.offset!,
        autoCompleteItem.offset! + autoCompleteItem.length!);

    result.add(TextSpan(
      text: boldText,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 15,
      ),
    ));

    var remainingText = autoCompleteItem.text!
        .substring(autoCompleteItem.offset! + autoCompleteItem.length!);
    result.add(
      TextSpan(
        text: remainingText,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );

    return result;
  }
}

class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSearchInput;

  const SearchInput(this.onSearchInput);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  InputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
        color: Colors.black, width: .2), // Enabled border color
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      onChanged: widget.onSearchInput,
      style: const TextStyle(color: Colors.black), // Text color
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: const Icon(Icons.search, color: Colors.black),
        // Icon color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        labelText: 'Add a new address',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(color: Colors.black),

      ),
    );
  }
}

Future<LocationResult?> showPlacePicker(
    BuildContext context, String apiKey) async {
  return await showModalBottomSheet<LocationResult>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.background,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: PlacePicker(apiKey),
      );
    },
  );
}
