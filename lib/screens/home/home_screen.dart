import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/smart_engagement_banner/index.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app.dart';
import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools/navigate_tools.dart';
import '../../custom/custom_controllers/app_controller.dart';
import '../../data/boxes.dart';
import '../../generated/l10n.dart';
import '../../models/app_model.dart';
import '../../models/cart/cart_model.dart';
import '../../modules/dynamic_layout/index.dart';
import '../../widgets/home/index.dart';
import '../base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.scrollController});

  final ScrollController? scrollController;

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseScreen<HomeScreen> {
  // @override
  // bool get wantKeepAlive => true;

  //region force update feature
  Future<void> showMaintenanceDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            child: Platform.isAndroid
                ? AlertDialog(
              content: Text(S.of(context).underMaintenanceContent),
            )
                : CupertinoAlertDialog(
              content: Text(S.of(context).underMaintenanceContent),
            ),
            onWillPop: () => Future.value(false));
      },
    );
  }

  Future<void> handleCurrentVersion() async {
    try {
      if (AppController.isUnderMaintenance) {
        await showMaintenanceDialog();
      } else if (AppController.isForceUpdate &&
          AppController.packageInfo != null) {
        await showUpdateDialog(
            AppController.packageInfo!, AppController.iosAppID);
      } else {}
    } catch (_) {}
  }

  Future<void> showUpdateDialog(
      PackageInfo packageInfo, String iosAppId) async {
    try {
      var ishuawei = false;
      try {
        final deviceInfo = DeviceInfoPlugin();
        var androidInfo = await deviceInfo.androidInfo;
        ishuawei = androidInfo.manufacturer == 'HUAWEI';
      } catch (e) {
        log(e.toString());
      }


      var actions = <Widget>[
        Platform.isAndroid ?
        (ishuawei ? TextButton(
          onPressed: () async {
            try {
              await launchAppStore(
                  'market://details?id=${packageInfo!.packageName}');
            } catch (e) {
              /// Open in browser
              /// get huawei appID and past at the end
              ///
              /// TODO huwawi id
              await launchAppStore('https://appgallery.cloud.huawei.com/marketshare/app/id');
            }
          },
          child: Text(S
              .of(context)
              .update),
        )
            :
        TextButton(
          onPressed: () async {
            try {
              await launchAppStore(
                  'market://details?id=${packageInfo.packageName}');
            } catch (e) {
              /// Open in browser
              await launchAppStore(
                  'https://play.google.com/store/apps/details?id=${packageInfo.packageName}');
            }
          },
          child: Text(S.of(context).update),
        ))
            :
        CupertinoDialogAction(
          onPressed: () async {
            try {
              await launchAppStore('itms-apps://apple.com/app/$iosAppId');
            } catch (e) {
              /// Open in browser
              await launchAppStore('https://apps.apple.com/app/$iosAppId');
            }
          },
          child: Text(S.of(context).update),
        ),
      ];

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              child: Platform.isAndroid
                  ? AlertDialog(
                title: Text(S.of(context).updateDialogTitle),
                content: Text(S.of(context).updateDialogText),
                actions: actions,
              )
                  : CupertinoAlertDialog(
                title: Text(S.of(context).updateDialogTitle),
                content: Text(S.of(context).updateDialogText),
                actions: actions,
              ),
              onWillPop: () => Future.value(false));
        },
      );
    } catch (_) {}
  }

  Future<void> launchAppStore(String appStoreLink) async {
    debugPrint(appStoreLink);
    if (await canLaunchUrlString(appStoreLink)) {
      await launchUrlString(appStoreLink, mode: LaunchMode.externalApplication);
    } else {
      throw '';
    }
  }



  @override
  void initState() {
    printLog('[Home] initState');
    Future.delayed(Duration.zero)
        .then((value) async => await handleCurrentVersion());
    super.initState();
  }
  //endregion

  @override
  void dispose() {
    printLog('[Home] dispose');
    super.dispose();
  }


  void afterClosePopup(int updatedTime) {
    SettingsBox().popupBannerLastUpdatedTime = updatedTime;
  }

  @override
  Widget build(BuildContext context) {
    printLog('[Home] build');

    return Selector<AppModel, (AppConfig?, String, String?)>(
      selector: (_, model) =>
          (model.appConfig, model.langCode, model.countryCode),
      builder: (_, value, child) {
        var appConfig = value.$1;
        var langCode = value.$2;
        final countryCode = value.$3;

        if (appConfig == null) {
          return kLoadingWidget(context);
        }

        var isStickyHeader = appConfig.settings.stickyHeader;
        final horizontalLayoutList =
            List.from(appConfig.jsonData['HorizonLayout']);
        final isShowAppbar = horizontalLayoutList.isNotEmpty &&
            horizontalLayoutList.first['layout'] == 'logo';

        final bannerConfig = appConfig.settings.smartEngagementBannerConfig;

        final isShowPopupBanner = (SettingsBox().popupBannerLastUpdatedTime !=
                bannerConfig.popup.updatedTime) ||
            bannerConfig.popup.alwaysShowUponOpen;

        return Scaffold(
          floatingActionButton: (context.watch<CartModel>().productsInCart.isNotEmpty) ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap: (){
                NavigateTools.navigateToCart(context);
              },
              child: Container(
                width: 175,
                height: 44,
                decoration: ShapeDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.50),
                  ),
                ),
                child:  Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                    Text('${context.watch<CartModel>().cartItemMetaDataInCart.length} View Cart',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                )),
              ),
            ),
          ) : const SizedBox.shrink(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Stack(
            children: <Widget>[
              if (appConfig.background != null && isDesktop == false)
                isStickyHeader
                    ? SafeArea(
                        child: HomeBackground(config: appConfig.background),
                      )
                    : HomeBackground(config: appConfig.background),
              HomeLayout(
                isPinAppBar: isStickyHeader,
                isShowAppbar: isShowAppbar,
                showNewAppBar:
                    appConfig.appBar?.shouldShowOn(RouteList.home) ?? false,
                configs: appConfig.jsonData,
                key: Key('$langCode$countryCode'),
                scrollController: widget.scrollController,
              ),
              SmartEngagementBanner(
                context: App.fluxStoreNavigatorKey.currentContext!,
                config: bannerConfig,
                enablePopup: isShowPopupBanner,
                afterClosePopup: () {
                  afterClosePopup(bannerConfig.popup.updatedTime);
                },
                childWidget: (data) {
                  return DynamicLayout(configLayout: data);
                },
              ),
              // Remove `WrapStatusBar` because we already have `SafeArea`
              // inside `HomeLayout`
              // const WrapStatusBar(),
            ],
          ),
        );
      },
    );
  }
}
