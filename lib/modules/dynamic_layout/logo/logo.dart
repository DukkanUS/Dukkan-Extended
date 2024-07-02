import 'package:flutter/material.dart';
import 'package:inspireui/icons/icon_picker.dart' deferred as defer_icon;
import 'package:inspireui/inspireui.dart' show DeferredWidget;
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../data/boxes.dart';
import '../../../models/index.dart';
import '../../../services/services.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/common/place_picker.dart';
import '../../../widgets/multi_site/multi_site_mixin.dart';
import '../config/logo_config.dart';

class LogoIcon extends StatelessWidget {
  final LogoConfig config;
  final Function onTap;
  final MenuIcon? menuIcon;
  final EdgeInsetsDirectional? padding;
  final bool showNumber;
  final int number;

  const LogoIcon({
    super.key,
    required this.config,
    required this.onTap,
    this.menuIcon,
    this.showNumber = false,
    this.number = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final boxSize = config.iconSize + config.iconSpreadRadius;
    Widget widget = InkWell(
      onTap: () => onTap.call(),
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          color: config.iconBackground ??
              Theme.of(context)
                  .colorScheme
                  .background
                  .withOpacity(config.iconOpacity),
          borderRadius: BorderRadius.circular(config.iconRadius),
        ),
        child: menuIcon != null
            ? DeferredWidget(
                defer_icon.loadLibrary,
                () => Icon(
                  defer_icon.iconPicker(
                    menuIcon!.name!,
                    menuIcon!.fontFamily ?? 'CupertinoIcons',
                  ),
                  color: config.iconColor ??
                      Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  size: config.iconSize,
                ),
              )
            : Icon(
                Icons.blur_on,
                color: config.iconColor ??
                    Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                size: config.iconSize,
              ),
      ),
    );
    if (showNumber) {
      final boxSizeWithNumber = boxSize + 6;
      widget = SizedBox(
        width: boxSizeWithNumber,
        height: boxSizeWithNumber,
        child: Stack(
          children: [
            Center(child: widget),
            if (number > 0)
              PositionedDirectional(
                end: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: widget,
    );
  }
}

class Logo extends StatefulWidget with MultiSiteMixin {
  final Function() onSearch;
  final Function() onCheckout;
  final Function() onTapDrawerMenu;
  final Function() onTapNotifications;
  final String? logo;
  final LogoConfig config;
  final int totalCart;
  final int notificationCount;

  Logo({
    super.key,
    required this.config,
    required this.onSearch,
    required this.onCheckout,
    required this.onTapDrawerMenu,
    required this.onTapNotifications,
    this.logo,
    this.totalCart = 0,
    this.notificationCount = 0,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  List<Address?> listAddress = [];

  List<CountryState>? states = [];

  // Address? address;

  Widget renderLogo() {
    final logoSize = widget.config.logoSize;

    if (widget.config.image != null) {
      if (widget.config.image!.contains('http')) {
        return SizedBox(
          height: logoSize - 10,
          child: FluxImage(
            imageUrl: widget.config.image!,
            height: logoSize,
            fit: BoxFit.contain,
          ),
        );
      }
      return Image.asset(
        widget.config.image!,
        height: logoSize,
      );
    }

    /// render from config to support dark/light theme
    if (widget.logo != null) {
      return FluxImage(imageUrl: widget.logo!, height: logoSize);
    }

    return const SizedBox();
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

  @override
  Widget build(BuildContext context) {
    var enableMultiSite = Configurations.multiSiteConfigs?.isNotEmpty ?? false;
    var user = Provider.of<UserModel>(context, listen: false).user;

    final currentAddress = Provider.of<CartModel>(context).address?.street;
    return Container(
      constraints: const BoxConstraints(minHeight: kToolbarHeight),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      color: widget.config.color ??
          Theme.of(context)
              .colorScheme
              .background
              .withOpacity(widget.config.opacity),
      child: Row(
        children: [
          if (widget.config.showMenu ?? false)
            LogoIcon(
              menuIcon: widget.config.menuIcon,
              onTap: widget.onTapDrawerMenu,
              config: widget.config,
            ),
          Expanded(
            flex: 8,
            child: Visibility(
              visible: UserBox().isLoggedIn,
              child: MaterialButton(
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
                      await saveDataToLocal(address);
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      (currentAddress == null || currentAddress == '') ? 'Choose address' : currentAddress,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_drop_down_sharp)

                    // if (config.showLogo) Center(child: renderLogo()),
                    // if (textConfig != null) ...[
                    //   if (config.showLogo) const SizedBox(width: 5),
                    //   Expanded(
                    //     child: Align(
                    //       alignment: textConfig.alignment,
                    //       child: Text(
                    //         textConfig.text,
                    //         style: TextStyle(
                    //           fontSize: textConfig.fontSize,
                    //           color: Theme.of(context).colorScheme.onBackground,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // ],
                  ],
                ),
              ),
            ),
          ),
          if (widget.config.showSearch)
            LogoIcon(
              menuIcon: widget.config.searchIcon ?? MenuIcon(name: 'search'),
              onTap: widget.onSearch,
              config: widget.config,
            ),
          if (widget.config.showBadgeCart)
            GestureDetector(
              onTap: widget.onCheckout,
              behavior: HitTestBehavior.translucent,
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.totalCart.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (widget.config.showCart)
            LogoIcon(
              padding: const EdgeInsetsDirectional.only(start: 8),
              menuIcon: widget.config.cartIcon ?? MenuIcon(name: 'bag'),
              onTap: widget.onCheckout,
              config: widget.config,
              showNumber: true,
              number: widget.totalCart,
            ),
          if (widget.config.showNotification)
            LogoIcon(
              padding: const EdgeInsetsDirectional.only(start: 8),
              menuIcon:
                  widget.config.notificationIcon ?? MenuIcon(name: 'bell'),
              onTap: widget.onTapNotifications,
              config: widget.config,
              showNumber: true,
              number: widget.notificationCount,
            ),
          if (!enableMultiSite &&
              !widget.config.showSearch &&
              !widget.config.showCart &&
              !widget.config.showBadgeCart &&
              !widget.config.showNotification)
            const Spacer(),
        ],
      ),
    );
  }
}
