import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools/price_tools.dart';
import '../../../custom/custom_controllers/auto_apply_coupons_controller.dart';
import '../../../custom/custom_entities/auto_apply_coupons/custom_coupon_entity.dart';
import '../../../custom/providers/address_validation.dart';
import '../../../custom/providers/delivery_time.dart';
import '../../../data/boxes.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart';
import '../../../models/tera_wallet/wallet_model.dart';
import '../../../modules/analytics/analytics.dart';
import '../../../modules/native_payment/razorpay/services.dart';
import '../../../services/services.dart';
import '../../../widgets/common/place_picker.dart';
import '../../../widgets/product/cart_item/cart_item.dart';
import '../../cart/widgets/shopping_cart_sumary.dart';
import '../mixins/checkout_mixin.dart';
import '../widgets/success.dart';

class SingleCheckoutPgeScreen extends StatefulWidget {
  const SingleCheckoutPgeScreen({super.key});

  @override
  State<SingleCheckoutPgeScreen> createState() =>
      _SingleCheckoutPgeScreenState();
}

class _SingleCheckoutPgeScreenState extends State<SingleCheckoutPgeScreen>
    with RazorDelegate, CheckoutMixin {
  bool _isDatePickerExpanded = true;
  String? _selectedTimePeriod;

  // int? selectedIndex = 0;
  bool isLoading = false;
  Order? newOrder;

  ShippingMethodModel get shippingMethodModel =>
      Provider.of<ShippingMethodModel>(context, listen: false);

  CartModel get cartModel => Provider.of<CartModel>(context, listen: false);

  bool _isPaymentExpanded = false;
  bool _isPhoneNumberExpanded = false;
  // bool _isBillingAddressExpanded = false;
  bool _isNotesExpanded = true;
  bool _isOrderPreviewExpanded = false;
  List<CountryState>? states = [];

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      ///fetch the shipping methods
     await Provider.of<ShippingMethodModel>(context, listen: false)
          .getShippingMethods(
          cartModel: Provider.of<CartModel>(context, listen: false), token: context.read<UserModel>().user?.cookie, langCode: Provider.of<AppModel>(context, listen: false).langCode);
     /// set the shipping method for the selected address or will show that the selected address is not supported yet

     if(shippingMethodModel.shippingMethods!.where((element) => element.title == cartModel.address?.zipCode.toString()).isNotEmpty) {
       Provider.of<AddressValidation>(context,listen: false).setValid();
       await cartModel.setShippingMethod(shippingMethodModel.shippingMethods!.where((element) => element.title == cartModel.address?.zipCode.toString()).first);
     }
     else
       {
         Provider.of<AddressValidation>(context,listen: false).setInvalid();
         await cartModel.removeShippingMethod();

         ///no supported method for such address.
       }

     ///fetch the payment methods for the selected shipping
      await Provider.of<PaymentMethodModel>(context, listen: false)
          .getPaymentMethods(
              cartModel: cartModel,
              shippingMethod: cartModel.shippingMethod,
              langCode: Provider.of<AppModel>(context, listen: false).langCode);
    });
    super.initState();
  }

  Future<void> saveDataToLocal(Address? address) async {
    var listAddress = <Address>[];
    if (address != null) {
      listAddress.add(address);
    }
    var listData = UserBox().addresses;
    if (listData.isNotEmpty) {
      for (var item in listData) {
        listAddress.add(item);
      }
    }
    UserBox().addresses = listAddress;
  }

  void _selectTimePeriod(String period) {
    setState(() {
      if(_selectedTimePeriod == period){
        _selectedTimePeriod = null;
        Provider.of<DeliveryTime>(context,listen: false).updateDeliveryTime(period: 'Any');
      }else {
        _selectedTimePeriod = period;
        Provider.of<DeliveryTime>(context,listen: false).updateDeliveryTime(period: period);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textFieldDecoration = InputDecoration(
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(20),
    //     borderSide: const BorderSide(color: Colors.black),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(20),
    //     borderSide: const BorderSide(color: Colors.black),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(20),
    //     borderSide: const BorderSide(color: Colors.black),
    //   ),
    //   contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    // );
    final cartModel = Provider.of<CartModel>(context);
    final paymentMethodModel = Provider.of<PaymentMethodModel>(context);
    var user = Provider.of<UserModel>(context, listen: false).user;
    final taxModel = Provider.of<TaxModel>(context);
    final currencyRate = Provider.of<AppModel>(context).currencyRate;
    final bgColor = Theme.of(context).primaryColor;
    return SafeArea(
      top: true,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
          visible: (newOrder == null),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: FloatingActionButton.extended(
                backgroundColor: bgColor,
                onPressed: (paymentMethodModel.message?.isNotEmpty ?? false)
                    ? null
                    : () =>
                isPaying || selectedId == null
                        ? showSnackbar
                        : {
                  if(shippingMethodModel.shippingMethods?.isNotEmpty ?? false) {
                    if(shippingMethodModel.shippingMethods!.where((sm) => sm.title.toString().contains(cartModel.address?.zipCode.toString() ?? '****')).isNotEmpty){
                      cartModel.setShippingMethod(shippingMethodModel.shippingMethods!.where((element) => element.title == cartModel.address?.zipCode.toString()).first),
                      placeOrder(paymentMethodModel, cartModel)
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selected address is not supported yet',style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Colors.red,))
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No shipping methods in the meantime',style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Colors.red,))
                  }
                },
                label: Row(
                  children: [
                    Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      size: 20,
                      color: bgColor.getColorBasedOnBackground,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      S.of(context).placeMyOrder.toUpperCase(),
                      style: TextStyle(
                        color: bgColor.getColorBasedOnBackground,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Checkout'),
          centerTitle: true,
        ),
        body: newOrder != null
            ? OrderedSuccess(
                order: newOrder,
                hasScroll: isDesktop == false,
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Address Controller
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () async {
                              final apiKey = kIsWeb
                                  ? kGoogleApiKey.web
                                  : isIos
                                      ? kGoogleApiKey.ios
                                      : kGoogleApiKey.android;

                              await showPlacePicker(context, apiKey)
                                  .then((result) async {
                                if (result is LocationResult) {
                                  var address = Address();
                                  address.country = result.country;
                                  address.apartment = result.apartment;
                                  address.street = result.street;
                                  address.state = result.state;
                                  address.city = result.city;
                                  address.zipCode = result.zip;
                                  if (result.latLng?.latitude != null &&
                                      result.latLng?.longitude != null) {
                                    address.mapUrl =
                                        'https://maps.google.com/maps?q=${result.latLng?.latitude},${result.latLng?.longitude}&output=embed';
                                    address.latitude =
                                        result.latLng?.latitude.toString();
                                    address.longitude =
                                        result.latLng?.longitude.toString();
                                  }

                                  address.firstName = user?.firstName;
                                  address.lastName = user?.lastName;
                                  address.email = user?.email;
                                  address.phoneNumber = user?.phoneNumber;

                                  Provider.of<CartModel>(context, listen: false)
                                      .setAddress(address);
                                  final c = Country(
                                      id: result.country, name: result.country);
                                  states =
                                      await Services().widget.loadStates(c);
                                  await saveDataToLocal(address);

                                  if(shippingMethodModel.shippingMethods!.where((element) => element.title == cartModel.address?.zipCode.toString()).isNotEmpty) {
                                    await cartModel.setShippingMethod(shippingMethodModel.shippingMethods!.where((element) => element.title == cartModel.address?.zipCode.toString()).first);
                                    Provider.of<AddressValidation>(context,listen: false).setValid();
                                    setState(() {});
                                  }
                                  else
                                  {
                                    Provider.of<AddressValidation>(context,listen: false).setInvalid();
                                      await cartModel.removeShippingMethod();
                                      setState(() {});
                                    ///no supported method for such address.
                                  }

                                }
                              });
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  Provider.of<CartModel>(context)
                                          .address
                                          ?.street ??
                                      'Choose Address',
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),


                        // /// Billing Address
                        // (Provider.of<CartModel>(context).address?.street?.isNotEmpty ?? false)
                        //     ? GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       _isBillingAddressExpanded = !_isBillingAddressExpanded;
                        //     });
                        //   },
                        //   child: ExpansionPanelList(
                        //     expansionCallback:
                        //         (int index, bool isExpanded) {
                        //       setState(() {
                        //         _isBillingAddressExpanded = isExpanded;
                        //       });
                        //     },
                        //     children: [
                        //       ExpansionPanel(
                        //         headerBuilder: (BuildContext context,
                        //             bool isExpanded) {
                        //           return  ListTile(
                        //             title: Row(
                        //               children: [
                        //                 Icon(
                        //                   Icons.location_on,
                        //                   color: Colors.black,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 10,
                        //                 ),
                        //                 Text('${shippingMethodModel.shippingMethods?.first}',style: TextStyle(fontWeight: FontWeight.bold),),
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //         body: Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 20),
                        //           child: Column(
                        //             children: [
                        //               TextFormField(
                        //                 key: const Key('name'),
                        //                 initialValue: user?.billing?.address1,
                        //                 onChanged: (val){
                        //                   user?.billing?.address1 = val;
                        //                 },
                        //                 decoration: textFieldDecoration,
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //         isExpanded: _isBillingAddressExpanded,
                        //       ),
                        //     ],
                        //   ),
                        // )
                        //     : const SizedBox.shrink(),

                        /// Delivery Instructions
                        (kEnableCustomerNote)
                            ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _isNotesExpanded = !_isNotesExpanded;
                            });
                          },
                          child: ExpansionPanelList(
                            expansionCallback:
                                (int index, bool isExpanded) {
                              setState(() {
                                _isNotesExpanded = isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                headerBuilder: (BuildContext context,
                                    bool isExpanded) {
                                  return const ListTile(
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.notes,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Delivery Instructions',style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  );
                                },
                                body: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.2,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    initialValue: UserBox().orderNotesFromLocal,
                                    onChanged: (value) async{
                                      cartModel.setOrderNotes(value);
                                      await context.read<UserModel>().saveOrderNotesToLocal(value: value);
                                    },
                                    maxLines: 5,
                                    style: const TextStyle(fontSize: 13),
                                    decoration: const InputDecoration(
                                        hintText:
                                        'Add access code, best entrance, etc.',
                                        hintStyle:
                                        TextStyle(fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                                isExpanded: _isNotesExpanded,
                              ),
                            ],
                          ),
                        )
                            : const SizedBox.shrink(),

                        /// Delivery Time
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDatePickerExpanded = !_isDatePickerExpanded;
                            });
                          },
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _isDatePickerExpanded = !isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return  ListTile(
                                    title: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time_filled,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text((_selectedTimePeriod != null) ? _selectedTimePeriod! :'Delivery Time',style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  );
                                },
                                body: Column(
                                  children: [
                                    _buildTimeOption('9AM - 12PM'),
                                    const SizedBox(height: 10),
                                    _buildTimeOption('12PM - 3PM'),
                                    const SizedBox(height: 10),
                                    _buildTimeOption('3PM - 6PM'),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                isExpanded: _isDatePickerExpanded,
                              ),
                            ],
                          ),
                        ),

                        ///Phone Number
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPhoneNumberExpanded = !_isPhoneNumberExpanded;
                            });
                          },
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _isPhoneNumberExpanded = isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        const Icon(
                                          Icons.phone_android_sharp,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(((cartModel.address?.phoneNumber
                                                        ?.isNotEmpty ??
                                                    false) &&
                                                cartModel
                                                        .address?.phoneNumber !=
                                                    '')
                                            ? (cartModel.address?.phoneNumber ??
                                                'Phone Number')
                                            : 'Phone Number',style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    keyboardType: TextInputType.phone,
                                    initialValue:
                                        cartModel.address?.phoneNumber,
                                    onChanged: (value) {
                                      setState(() {
                                        cartModel.address?.phoneNumber = value;
                                      });
                                    },
                                  ),
                                ),
                                isExpanded: _isPhoneNumberExpanded,
                              ),
                            ],
                          ),
                        ),


                        ///Payment Methods
                        ListenableProvider.value(
                          value: paymentMethodModel,
                          child: Consumer2<PaymentMethodModel, WalletModel>(
                              builder: (context, model, walletModel, child) {
                            if (model.isLoading) {
                              return SizedBox(
                                  height: 100,
                                  child: SizedBox(
                                    height: 100,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ));
                            }

                            if (model.message != null) {
                              return SizedBox(
                                height: 100,
                                child: Center(
                                    child: Text(model.message!,
                                        style: const TextStyle(
                                            color: Colors.red))),
                              );
                            }
                            if (paymentMethodModel.paymentMethods.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text('No payment options available'),
                                ),
                              );
                            }

                            var ignoreWallet = false;
                            final isWalletExisted = model.paymentMethods
                                    .firstWhereOrNull(
                                        (e) => e.id == 'wallet') !=
                                null;
                            if (isWalletExisted) {
                              final total = (cartModel.getTotal() ?? 0) +
                                  cartModel.walletAmount;
                              ignoreWallet = total > walletModel.balance;
                            }

                            if (selectedId == null &&
                                model.paymentMethods.isNotEmpty) {
                              selectedId =
                                  model.paymentMethods.firstWhereOrNull((item) {
                                if (ignoreWallet) {
                                  return item.id != 'wallet' && item.enabled!;
                                } else {
                                  return item.enabled!;
                                }
                              })?.id;
                              cartModel.setPaymentMethod(model.paymentMethods
                                  .firstWhere((item) => item.id == selectedId));
                            }
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPaymentExpanded = !_isPaymentExpanded;
                                });
                              },
                              child: ExpansionPanelList(
                                expansionCallback:
                                    (int index, bool isExpanded) {
                                  setState(() {
                                    _isPaymentExpanded = isExpanded;
                                  });
                                },
                                children: [
                                  ExpansionPanel(
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return ListTile(
                                        title: Row(
                                          children: [
                                            const Icon(
                                              Icons.monetization_on,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(cartModel
                                                    .paymentMethod?.title ??
                                                'Payment Methods',style: const TextStyle(fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      );
                                    },
                                    body: Column(
                                      children: <Widget>[
                                        for (int i = 0;
                                            i < model.paymentMethods.length;
                                            i++)
                                          model.paymentMethods[i].enabled!
                                              ? Services()
                                                  .widget
                                                  .renderPaymentMethodItem(
                                                  context,
                                                  model.paymentMethods[i],
                                                  (i) {
                                                    setState(() {
                                                      selectedId = i;
                                                    });
                                                    final paymentMethod =
                                                        paymentMethodModel
                                                            .paymentMethods
                                                            .firstWhere(
                                                                (item) =>
                                                                    item.id ==
                                                                    i);
                                                    cartModel.setPaymentMethod(
                                                        paymentMethod);
                                                  },
                                                  selectedId,
                                                  useDesktopStyle: false,
                                                )
                                              : const SizedBox()
                                      ],
                                    ),
                                    isExpanded: _isPaymentExpanded,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),

                        ///order preview
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isOrderPreviewExpanded =
                                  !_isOrderPreviewExpanded;
                            });
                          },
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _isOrderPreviewExpanded = isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return const ListTile(
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Order Preview',style: TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    children: getProducts(cartModel, context),
                                  ),
                                ),
                                isExpanded: _isOrderPreviewExpanded,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                        const ShoppingCartSummary(showPrice: false,hideCoupon: true,),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                S.of(context).subtotal,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.8),
                                ),
                              ),
                              Text(
                                  PriceTools.getCurrencyFormatted(
                                      cartModel.getSubTotal(), currencyRate,
                                      currency: cartModel.currencyCode)!,
                                  style: const TextStyle(
                                      fontSize: 14, color: kGrey400))
                            ],
                          ),
                        ),
                        Services().widget.renderShippingMethodInfo(context),
                        if (cartModel.getCoupon() != '')
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  S.of(context).discount,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  cartModel.getCoupon(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.8),
                                      ),
                                )
                              ],
                            ),
                          ),
                        Services().widget.renderTaxes(taxModel, context),
                        Services().widget.renderRewardInfo(context),
                        Services().widget.renderCheckoutWalletInfo(context),
                        Services().widget.renderCODExtraFee(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                S.of(context).total,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              Text(
                                PriceTools.getCurrencyFormatted(
                                    cartModel.getTotal(), currencyRate,
                                    currency: cartModel.currencyCode)!,
                                style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ),
                        //region auto apply coupons feature
                        FutureBuilder<CustomCouponDetailsEntity?>(
                          builder: (context,snapShot) {
                            if(snapShot.connectionState == ConnectionState.waiting)
                            {
                              return const SizedBox.shrink();
                            }
                            else if(snapShot.hasData && snapShot.data!=null) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      S.of(context).totalWithAutoApply,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).colorScheme.secondary),
                                    ),
                                    Text(
                                      PriceTools.getCurrencyFormatted(

                                          (cartModel.getTotal()??0)-(snapShot.data?.totalDiscount??0)
                                              -((snapShot.data?.isFreeShipping ?? false) ? cartModel.getShippingCost() ?? 0:0)
                                          , currencyRate,
                                          currency: cartModel.currencyCode)!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )
                                  ],
                                ),
                              );

                            }
                            else
                            {
                              return const SizedBox.shrink();
                            }
                          },
                          future: AutoApplyCouponController.getAutoApplyCouponsDetails(cartModel),

                        ),
                        //endregion
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                  isLoading
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white.withOpacity(0.36),
                          child: kLoadingWidget(context),
                        )
                      : const SizedBox()
                ],
              ),
      ),
    );
  }

  List<Widget> getProducts(CartModel model, BuildContext context) {
    return model.productsInCart.keys.map(
      (key) {
        var productId = Product.cleanProductID(key);

        return ShoppingCartRow(
          cartItemMetaData: model.cartItemMetaDataInCart[key]
              ?.copyWith(variation: model.getProductVariationById(key)),
          product: model.getProductById(productId),
          quantity: model.productsInCart[key],
        );
      },
    ).toList();
  }

  @override
  Function? get onBack => null;

  @override
  Function? get onFinish => _checkoutOnFinish;

  @override
  Function(bool)? get onLoading => _setLoading;

  void _setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  void _checkoutOnFinish(order) async {
    final cartModel = Provider.of<CartModel>(context, listen: false);

    setState(() {
      newOrder = order;
    });

    Analytics.triggerPurchased(order, context);

    await Services().widget.updateOrderAfterCheckout(context, order);
    cartModel.clearCart();
    unawaited(context.read<WalletModel>().refreshWallet());

    if (isDesktop && order != null) {
      unawaited(Navigator.of(context)
          .pushNamed(RouteList.orderdSuccess, arguments: {'order': order}));
    }
  }

  Widget _buildTimeOption(String period) {
    var isSelected = _selectedTimePeriod == period;
    return GestureDetector(
      onTap: () => _selectTimePeriod(period),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  isSelected ? Theme.of(context).primaryColor : Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          period,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
