import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspireui/icons/constants.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../custom/providers/address_validation.dart';
import '../../data/boxes.dart';
import '../../models/app_model.dart';
import '../../models/cart/cart_base.dart';
import '../../models/entities/address.dart';
import '../../models/entities/country.dart';
import '../../models/entities/country_state.dart';
import '../../models/notification_model.dart';
import '../../models/shipping_method_model.dart';
import '../../models/user_model.dart';
import '../../modules/dynamic_layout/config/logo_config.dart';
import '../../modules/dynamic_layout/dynamic_layout.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../modules/dynamic_layout/logo/logo.dart';
import '../../routes/flux_navigate.dart';
import '../../screens/common/app_bar_mixin.dart';
import '../../services/index.dart';
import '../common/dialogs.dart';
import '../common/place_picker.dart';
import '../web_layout/web_layout.dart';
import 'preview_overlay.dart';

class HomeLayout extends StatefulWidget {
  final configs;
  final bool isPinAppBar;
  final bool isShowAppbar;
  final bool showNewAppBar;
  final bool enableRefresh;
  final ScrollController? scrollController;

  const HomeLayout({
    this.configs,
    this.isPinAppBar = false,
    this.isShowAppbar = true,
    this.showNewAppBar = false,
    this.enableRefresh = true,
    this.scrollController,
    super.key,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with AppBarMixin {
  late List widgetData;
  dynamic verticalWidgetData;
  var _useNestedScrollView = true;

  bool isLoggedIn = UserBox().isLoggedIn;

  bool isPreviewingAppBar = false;

  bool cleanCache = false;

  @override
  void initState() {
    /// init config data
    widgetData =
        List<Map<String, dynamic>>.from(widget.configs['HorizonLayout']);
    if (widgetData.isNotEmpty && widget.isShowAppbar && !widget.showNewAppBar) {
      widgetData.removeAt(0);
    }

    /// init single vertical layout
    if (widget.configs['VerticalLayout'] != null &&
        widget.configs['VerticalLayout'].isNotEmpty) {
      Map verticalData =
          Map<String, dynamic>.from(widget.configs['VerticalLayout']);
      verticalData['type'] = 'vertical';
      verticalWidgetData = verticalData;
    }

    super.initState();
  }
  var user = Provider.of<UserModel>(App.fluxStoreNavigatorKey.currentState!.context, listen: false).user;

  ShippingMethodModel get shippingMethodModel =>
      Provider.of<ShippingMethodModel>(context, listen: false);

  CartModel get cartModel => Provider.of<CartModel>(context, listen: false);

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

  List<Address?> listAddress = [];

  List<CountryState>? states = [];
  final currentAddress = Provider.of<CartModel>(App.fluxStoreNavigatorKey.currentState!.context).address?.street;


  @override
  void didUpdateWidget(HomeLayout oldWidget) {
    if (oldWidget.configs != widget.configs) {
      /// init config data
      List data =
          List<Map<String, dynamic>>.from(widget.configs['HorizonLayout']);
      if (data.isNotEmpty && widget.isShowAppbar && !widget.showNewAppBar) {
        data.removeAt(0);
      }
      widgetData = data;

      /// init vertical layout
      if (widget.configs['VerticalLayout'] != null) {
        Map verticalData =
            Map<String, dynamic>.from(widget.configs['VerticalLayout']);
        verticalData['type'] = 'vertical';
        verticalWidgetData = verticalData;
      }
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> onRefresh() async {
    /// No need refreshBlogs anymore because we will reload appConfig like below
    // await Provider.of<ListBlogModel>(context, listen: false).refreshBlogs();

    // refresh the product request and clean up cache
    setState(() => cleanCache = true);
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    setState(() => cleanCache = false);

    var appModel = Provider.of<AppModel>(context, listen: false);
    final oldAppConfig = appModel.appConfig;

    // reload app config will refresh all tabs in tabbar, not only home screen
    final newAppconfig = await appModel.loadAppConfig(config: kLayoutConfig);

    // Show a popup if there is a big difference in config
    if (newAppconfig?.tabBar.length != oldAppConfig?.tabBar.length) {
      await showDialogNewAppConfig(context);
    }
  }

  Widget renderAppBar() {
    return SliverAppBar(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
      toolbarHeight: (isLoggedIn) ? 140 : 100,
      floating: true,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox( height: MediaQuery.sizeOf(context).height * 0.045,width: MediaQuery.sizeOf(context).width * 0.35, child: Image.asset('assets/images/white_logo.png')),
            (isLoggedIn) ?  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,child: MaterialButton(
              onPressed: () async {
                final apiKey = kIsWeb
                    ? kGoogleApiKey.web
                    : isIos
                    ? kGoogleApiKey.ios
                    : kGoogleApiKey.android;

                await showPlacePicker(context, apiKey).then((result) async {
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
                      address.latitude = result.latLng?.latitude.toString();
                      address.longitude = result.latLng?.longitude.toString();
                    }

                    address.firstName = user?.firstName;
                    address.lastName = user?.lastName;
                    address.email = user?.email;
                    address.phoneNumber = user?.phoneNumber;

                    Provider.of<CartModel>(context, listen: false)
                        .setAddress(address);
                    final c = Country(id: result.country, name: result.country);
                    states = await Services().widget.loadStates(c);
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
                    await saveDataToLocal(address);
                  }
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 19,
                        height: 19,
                        child: Image.asset('assets/images/Pin.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          ((currentAddress == null) || (currentAddress == '' )) ? 'Choose address' : (currentAddress ?? ''),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 14,)
                    ],
                  ),
                  !Provider.of<AddressValidation>(context).isValid ?
                  const Text('(Your Address Is Out Of Service Area)',style: TextStyle(color: Colors.red,fontSize: 10),)
                      : const SizedBox.shrink()],
              ),
            )) : const SizedBox.shrink(),
            (isLoggedIn) ?  const SizedBox.shrink() : const SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                FluxNavigate.pushNamed(
                  RouteList.homeSearch,
                  forceRootNavigator: true,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                height: MediaQuery.sizeOf(context).height * .042,
                width: MediaQuery.sizeOf(context).width * .9,
                child:  Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Text(
                        style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),
                        (isLoggedIn) ? 'Salam ${user?.firstName}, Search Dukkan' : 'Search Dukkan',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.configs == null) return const SizedBox();

    ErrorWidget.builder = (error) {
      if (foundation.kReleaseMode) {
        return const SizedBox();
      }
      return Container(
        constraints: const BoxConstraints(minHeight: 150),
        decoration: BoxDecoration(
            color: Colors.lightBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        /// Hide error, if you're developer, enable it to fix error it has
        child: Center(
          child: Text('Error in ${error.exceptionAsString()}'),
        ),
      );
    };
    if (horizontalLayouts.length == 1 && widget.enableRefresh) {
      _useNestedScrollView = false;
    }

    if (Layout.isDisplayDesktop(context)) {
      return SafeArea(
        bottom: false,
        child: SliverWebLayout(
          slivers: horizontalLayouts,
          scrollController: widget.scrollController,
          physics: const BouncingScrollPhysics(),
        ),
      );
    }

    return SafeArea(
      top: false,
      bottom: false,
      child: verticalWidgetData == null
          ? CustomScrollView(
              cacheExtent: 2000,
              slivers: horizontalLayouts,
              controller: widget.scrollController,
              physics: const BouncingScrollPhysics(),
            )
          : horizontalLayouts.isNotEmpty
              ? NestedScrollView(
                  controller: widget.scrollController,
                  headerSliverBuilder: (context, _) {
                    return horizontalLayouts;
                  },
                  body: verticalLayout,
                )
              : verticalLayout,
    );
  }

  List<Widget> get horizontalLayouts => <Widget>[
        if (widget.showNewAppBar) sliverAppBarWidget,
        if (widget.isShowAppbar && !widget.showNewAppBar) renderAppBar(),
        if (widget.enableRefresh)
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
            refreshTriggerPullDistance: 175,
          ),
        if (widgetData.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var config = widgetData[index];

                /// if show app bar, the preview should plus +1
                var previewIndex = widget.isShowAppbar ? index + 1 : index;
                Widget body = PreviewOverlay(
                  index: previewIndex,
                  config: config,
                  builder: (value) {
                    return DynamicLayout(
                        configLayout: value, cleanCache: cleanCache);
                  },
                );

                /// Use row to limit the drawing area.
                /// If you delete the row, setting the size for the body will not work.
                return LayoutBuilder(
                  builder: (_, constraints) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth < kLimitWidthScreen
                              ? constraints.maxWidth
                              : kLimitWidthScreen,
                        ),
                        child: body,
                      ),
                    ],
                  ),
                );
              },
              childCount: widgetData.length,
            ),
          ),
      ];

  Widget get verticalLayout => PreviewOverlay(
        index: widgetData.length,
        config: verticalWidgetData,
        builder: (value) {
          return Services().widget.renderVerticalLayout(
                value,
                horizontalLayouts.isEmpty || _useNestedScrollView == false,
                onRefresh: widget.enableRefresh && _useNestedScrollView == false
                    ? onRefresh
                    : null,
              );
        },
      );
}
