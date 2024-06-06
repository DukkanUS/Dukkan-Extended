import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fstore/widgets/common/place_picker.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'common/config.dart';
import 'common/config/models/onboarding_config.dart';
import 'common/constants.dart';
import 'common/tools.dart';
import 'common/tools/flash.dart';
import 'data/boxes.dart';
import 'generated/l10n.dart';
import 'models/index.dart'
    show
        Address,
        AppModel,
        CartModel,
        CategoryModel,
        FilterAttributeModel,
        FilterTagModel,
        ListingLocationModel,
        NotificationModel,
        ProductPriceModel,
        TagModel,
        UserModel;
import 'modules/dynamic_layout/config/app_config.dart';
import 'modules/dynamic_layout/helper/helper.dart';
import 'screens/app_error.dart';
import 'screens/base_screen.dart';
import 'screens/blog/models/list_blog_model.dart';
import 'services/index.dart';
import 'widgets/common/splash_screen.dart';

class AppInit extends StatefulWidget {
  const AppInit();

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends BaseScreen<AppInit> {
  List<Address?> listAddress = [];
  Address? address;
  Address? remoteAddress;

  /// It is true if the app is initialized
  bool isLoggedIn = false;
  bool hasLoadedData = false;
  bool hasLoadedSplash = false;

  late AppConfig? appConfig;

  AppModel get appModel => Provider.of<AppModel>(context, listen: false);

  OnBoardingConfig get onBoardingConfig =>
      appModel.appConfig?.onBoardingConfig ?? kOnBoardingConfig;

  NotificationModel get _notificationModel =>
      Provider.of<NotificationModel>(context, listen: false);

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

  Future<void> saveDataToLocal() async {
    var listAddress = <Address>[];
    final address = this.address;
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
    await Navigator.of(App.fluxStoreNavigatorKey.currentState!.context)
        .pushReplacementNamed(RouteList.dashboard);
  }

  Future<void> loadInitData() async {
    try {
      printLog('[AppState] Init Data 💫');
      isLoggedIn = UserBox().isLoggedIn;

      /// set the server config at first loading
      /// Load App model config
      if (ServerConfig().isBuilder) {
        Services().setAppConfig(serverConfig);
      }

      /// Load layout config
      appConfig = await appModel.loadAppConfig(config: kLayoutConfig);

      Future.delayed(Duration.zero, () {
        /// Load more Category/Blog/Attribute Model beforehand
        final lang = appModel.langCode;

        /// Request Categories
        Provider.of<CategoryModel>(context, listen: false).getCategories(
          lang: lang,
          sortingList: appModel.categories,
          categoryLayout: appModel.categoryLayout,
          remapCategories: appModel.remapCategories,
        );
        hasLoadedData = true;
        if (hasLoadedSplash) {
          goToNextScreen();
        }
      });

      /// Request more Async data which is not use on home screen
      Future.delayed(
        Duration.zero,
        () {
          // Provider.of<TagModel>(context, listen: false).getTags();

          // Provider.of<ListBlogModel>(context, listen: false).getBlogs();

          // Provider.of<FilterTagModel>(context, listen: false).getFilterTags();

          Provider.of<FilterAttributeModel>(context, listen: false)
              .getFilterAttributes();

          final cartModel = Provider.of<CartModel>(context, listen: false);
          Provider.of<AppModel>(context, listen: false).loadCurrency(
              callback: (currencyRate) {
            cartModel.changeCurrencyRates(currencyRate);
          });

          context.read<ProductPriceModel>().getMinMaxPrices();

          if (ServerConfig().isListingType) {
            Provider.of<ListingLocationModel>(context, listen: false)
                .getLocations();
          }
        },
      );

      printLog('[AppState] InitData Finish');
    } catch (err, trace) {
      printError(err, trace);
    }
  }

  void goToNextScreen() async {
    /// Update status bar color on Android
    if (isMobile) {
      SystemChrome.setSystemUIOverlayStyle((appModel.darkTheme)
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
            ));
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    }

    if (appConfig == null) {
      await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AppError(),
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }

    if (Services().widget.isRequiredLogin &&
        !SettingsBox().hasFinishedOnboarding) {
      await _notificationModel.enableNotification();
    }

    if (Layout.isDisplayDesktop(context)) {
      await Navigator.of(context).pushReplacementNamed(RouteList.dashboard);
      return;
    }

    if (!kIsWeb && appConfig != null) {
      if (onBoardingConfig.enableOnBoarding &&
          (!SettingsBox().hasFinishedOnboarding ||
              !onBoardingConfig.isOnlyShowOnFirstTime)) {
        await Navigator.of(context).pushReplacementNamed(RouteList.onBoarding);
        return;
      }

      if (!SettingsBox().hasFinishedOnboarding) {
        if (kAdvanceConfig.showRequestNotification) {
          await Navigator.of(context)
              .pushReplacementNamed(RouteList.notificationRequest);
          return;
        }
        await _notificationModel.enableNotification();
        SettingsBox().hasFinishedOnboarding = true;
      }
    }

    if (kAdvanceConfig.gdprConfig.showPrivacyPolicyFirstTime &&
        !UserBox().hasAgreedPrivacy) {
      await Navigator.of(context).pushReplacementNamed(RouteList.privacyTerms);
      return;
    }

    if (!SettingsBox().hasSelectedSite &&
        (Configurations.multiSiteConfigs?.isNotEmpty ?? false) &&
        kAdvanceConfig.isRequiredSiteSelection) {
      await Navigator.of(context).pushNamed(RouteList.multiSiteSelection);
      SettingsBox().hasSelectedSite = true;
    }

    if (Services().widget.isRequiredLogin && !isLoggedIn) {
      await NavigateTools.navigateToLogin(
        context,
        replacement: true,
      );
      return;
    } else {
      getDataFromLocal();
      if (isLoggedIn && listAddress.isEmpty) {
        var user = Provider.of<UserModel>(context, listen: false).user;
        await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => PlacePicker(
                kIsWeb
                    ? kGoogleApiKey.web
                    : isIos
                        ? kGoogleApiKey.ios
                        : kGoogleApiKey.android,
                onPop: (validContext, result) async {
              if (result is LocationResult) {
                try {
                  address = Address();
                  address?.country = result.country;
                  address?.apartment = result.apartment;
                  address?.street = result.street;
                  address?.state = result.state;
                  address?.city = result.city;
                  address?.zipCode = result.zip;
                  if (result.latLng?.latitude != null &&
                      result.latLng?.latitude != null) {
                    address?.mapUrl =
                        'https://maps.google.com/maps?q=${result.latLng?.latitude},${result.latLng?.longitude}&output=embed';
                    address?.latitude = result.latLng?.latitude.toString();
                    address?.longitude = result.latLng?.longitude.toString();
                  }
                  address?.firstName = user?.firstName;
                  address?.lastName = user?.lastName;
                  address?.email = user?.email;
                  address?.phoneNumber = user?.phoneNumber;

                  if (address != null) {
                    Provider.of<CartModel>(validContext, listen: false)
                        .setAddress(address);
                    await saveDataToLocal();
                    return;
                  } else {
                    await FlashHelper.errorMessage(
                      validContext,
                      message: S.of(validContext).pleaseInput,
                    );
                  }
                } catch (e) {
                  log('fuckk :: $e');
                  await FlashHelper.errorMessage(
                    validContext,
                    message: e.toString(),
                  );
                }
              }
            }
                // fromRegister: true,
                ),
          ),
          (route) => false,
        );
      }
    }

    await Navigator.of(context).pushReplacementNamed(RouteList.dashboard);
  }

  void checkToShowNextScreen() {
    /// If the config was load complete then navigate to Dashboard
    hasLoadedSplash = true;
    if (hasLoadedData) {
      goToNextScreen();
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await loadInitData();
  }

  @override
  Widget build(BuildContext context) {
    var splashScreenType = kSplashScreen.type;
    dynamic splashScreenImage = kSplashScreen.image;
    var duration = kSplashScreen.duration;
    return SplashScreenIndex(
      imageUrl: splashScreenImage,
      splashScreenType: splashScreenType,
      actionDone: checkToShowNextScreen,
      duration: duration,
    );
  }
}
