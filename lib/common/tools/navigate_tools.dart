import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/boxes.dart';
import '../../generated/l10n.dart';
import '../../menu/maintab_delegate.dart';
import '../../models/app_model.dart';
import '../../models/index.dart'
    show BackDropArguments, CartModel, Product, UserModel;
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../modules/dynamic_layout/index.dart';
import '../../routes/flux_navigate.dart';
import '../../screens/blog/views/blog_list_category.dart';
import '../../screens/index.dart';
import '../../services/index.dart';
import '../../widgets/common/webview.dart';
import '../config.dart';
import '../constants.dart';
import '../events.dart';
import '../tools.dart';
import 'flash.dart';

class NavigateTools {
  static final Map<String, dynamic> _pendingAction = {};

  static Future onTapNavigateOptions(
      {BuildContext? context,
      required Map config,
      List<Product>? products}) async {
    /// support to show the product detail
    if (config['product'] != null) {
      if (context != null) {
        unawaited(
          FlashHelper.message(
            context,
            message: S.of(context).loading,
            duration: const Duration(seconds: 1),
          ),
        );
      }

      /// Prevent users from tapping multiple times.
      if (_pendingAction[config['product'].toString()] == true) {
        return;
      }

      _pendingAction[config['product'].toString()] = true;

      /// for pre-load the product detail
      final service = Services();
      var product = await service.api.getProduct(config['product'].toString());

      _pendingAction.remove(config['product'].toString());

      if (product == null || product.isEmptyProduct()) {
        return;
      }

      return FluxNavigate.pushNamed(
        RouteList.productDetail,
        arguments: product,
      );
    }
    if (config['tab'] != null) {
      return MainTabControlDelegate.getInstance().changeTab(config['tab']);
    }
    if (config['tab_number'] != null) {
      final index = (Helper.formatInt(config['tab_number'], 1) ?? 1) - 1;
      if (context != null) {
        var appModel = Provider.of<AppModel>(context, listen: false);
        final userModel = Provider.of<UserModel>(context, listen: false);
        var tabData = appModel.appConfig?.tabBar[index];

        if (tabData != null) {
          var routeData;
          if (['chat-gpt', 'image-generate', 'text-generate']
              .contains(tabData.layout)) {
            routeData = {
              'identifier': userModel.user?.email,
              'loginCallback': () async {
                await FluxNavigate.pushNamed(
                  RouteList.login,
                  forceRootNavigator: true,
                );
                final userModel =
                    Provider.of<UserModel>(context, listen: false);
                return userModel.user?.email;
              },
            };
          }
          if (!tabData.visible) {
            return FluxNavigate.pushNamed(
              RouteList.pageTab,
              arguments: routeData ?? tabData,
            );
          }
          if (tabData.isFullscreen) {
            return FluxNavigate.pushNamed(
              tabData.layout.toString(),
              arguments: routeData ?? tabData,
              forceRootNavigator: true,
            );
          }
        }
      }
      return MainTabControlDelegate.getInstance().tabAnimateTo(
        index,
      );
    }
    if (config['screen'] != null) {
      var tabData = TabBarMenuConfig(jsonData: {});
      var screen = config['screen'];
      var routeData;
      if (context != null) {
        var appModel = Provider.of<AppModel>(context, listen: false);
        tabData = appModel.appConfig?.tabBar
                .firstWhereOrNull((element) => element.layout == screen) ??
            tabData;
        final userModel = Provider.of<UserModel>(context, listen: false);

        if (['chat-gpt', 'image-generate', 'text-generate']
            .contains(tabData.layout)) {
          routeData = {
            'identifier': userModel.user?.email,
            'loginCallback': () async {
              await FluxNavigate.pushNamed(
                RouteList.login,
                forceRootNavigator: true,
              );
              final userModel = Provider.of<UserModel>(context, listen: false);
              return userModel.user?.email;
            },
          };
        } else if (screen == 'orders') {
          if (!userModel.loggedIn) {
            await navigateToLogin(context);
          }

          final user = context.read<UserModel>().user;

          if (user == null) {
            return;
          }

          routeData = user;
        }
      }

      if (config['fullscreen'] ?? false) {
        return FluxNavigate.pushNamed(
          screen,
          arguments: routeData ?? tabData,
        );
      }

      return Navigator.of(context!).pushNamed(
        screen,
        arguments: routeData ?? tabData,
      );
    }

    /// Launch the URL from external
    if (config['url_launch'] != null) {
      await Tools.launchURL(
        config['url_launch'],
        mode: LaunchMode.externalApplication,
      );
      return;
    }

    /// support to show blog detail
    if (config['blog'] != null) {
      final id = config['blog'].toString();
      return Navigator.of(context!).pushNamed(
        RouteList.detailBlog,
        arguments: BlogDetailArguments(id: id),
      );
    }

    /// support to show blog category
    if (config['blog_category'] != null) {
      return Navigator.push(
        context!,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              BlogListCategory(id: config['blog_category'].toString()),
          fullscreenDialog: true,
        ),
      );
    }

    if (config['coupon'] != null) {
      return Navigator.of(context!).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => CouponList(
            couponCode: config['coupon'].toString(),
            onSelect: (String couponCode) {
              UserBox().savedCoupon = couponCode;
              Provider.of<CartModel>(context, listen: false).loadSavedCoupon();

              Tools.showSnackBar(ScaffoldMessenger.of(context),
                  S.of(context).couponHasBeenSavedSuccessfully);
            },
          ),
        ),
      );
    }

    /// Navigate to vendor store on Banner Image
    if (config['vendor'] != null) {
      await Navigator.of(context!).push(
        MaterialPageRoute(
          builder: (context) =>
              Services().widget.renderVendorScreen(config['vendor']),
        ),
      );
      return;
    }

    /// support to show the post detail
    if (config['url'] != null) {
      String url = config['url'];
      if (context != null &&
          (ServerConfig().isWooType || ServerConfig().isWordPress)) {
        final cookie =
            Provider.of<UserModel>(context, listen: false).user?.cookie;
        url = url.addWooCookieToUrl(cookie);
      }

      return FluxNavigate.push(
        MaterialPageRoute(
          builder: (context) => WebView(
            url: url,
            enableBackward: config['enableBackward'] ?? false,
            enableForward: config['enableForward'] ?? false,
            enableClose: config['enableClose'] ?? true,
            title: config['title'] is String ? config['title'] : null,
          ),
        ),
      );
    } else {
      /// For static image
      if ((config['category'] == null ||
              config['category'] == kEmptyCategoryID) &&
          config['tag'] == null &&
          (products?.isEmpty ?? true) &&
          config['location'] == null) {
        return;
      }

      final category = config['category'];
      final showSubcategory = config['showSubcategory'] ?? false;

      if (category != null && showSubcategory) {
        unawaited(FluxNavigate.pushNamed(
          RouteList.subCategories,
          arguments: SubcategoryArguments(parentId: category.toString()),
        ));
        return;
      }

      /// Default navigate to show the list products
      await FluxNavigate.pushNamed(
        RouteList.backdrop,
        arguments: BackDropArguments(
          config: config,
          data: products,
        ),
      );
    }
  }

  static void onTapOpenDrawerMenu(BuildContext context) {
    if (Layout.isDisplayTablet(context)) {
      eventBus.fire(const EventSwitchStateCustomDrawer());
    } else if (isMobile) {
      eventBus.fire(const EventDrawerSettings());
      eventBus.fire(const EventOpenNativeDrawer());
    }
  }

  static void navigateHome(BuildContext context) {
    navigateToRootTab(context, RouteList.home);
  }
  static void navigateToCart(BuildContext context) {
    navigateToRootTab(context, RouteList.cart);
  }

  static void navigateToDefaultTab(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    MainTabControlDelegate.getInstance().changeToDefaultTab();
  }

  static void navigateToRootTab(BuildContext context, String name) {
    Navigator.popUntil(context, (route) => route.isFirst);
    MainTabControlDelegate.getInstance().changeTab(name);
  }

  static Future<void> navigateToLogin(context,
      {bool replacement = false}) async {
    if (kLoginSetting.smsLoginAsDefault) {
      await navigateToLoginSms(context, replacement: replacement);
      return;
    }
    await _getFluxNavigate(
      routeName: RouteList.login,
      replacement: replacement,
    );
  }

  static Future<void> navigateToLoginSms(BuildContext context,
      {bool replacement = false}) async {
    if (kAdvanceConfig.enableDigitsMobileLogin) {
      await _getFluxNavigate(
        routeName: RouteList.digitsMobileLogin,
        replacement: replacement,
      );
      return;
    }
    await _getFluxNavigate(
      routeName: RouteList.loginSMS,
      replacement: replacement,
    );
  }

  static Future<Object?> _getFluxNavigate({
    required String routeName,
    required bool replacement,
  }) {
    if (replacement) {
      return FluxNavigate.pushReplacementNamed(
        routeName,
        forceRootNavigator: true,
      );
    }
    return FluxNavigate.pushNamed(
      routeName,
      forceRootNavigator: true,
    );
  }

  static void navigateAfterLogin(user, context) {
    eventBus.fire(const EventLoggedIn());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${S.of(context).welcome} ${user.name} !'),
    ));

    if (kLoginSetting.isRequiredLogin) {
      Navigator.of(context).pushReplacementNamed(RouteList.dashboard);
      return;
    }

    var routeFound = false;
    var routeNames = [RouteList.dashboard, RouteList.productDetail];
    Navigator.popUntil(context, (route) {
      if (routeNames
          .any((element) => route.settings.name?.contains(element) ?? false)) {
        routeFound = true;
      }
      return routeFound || route.isFirst;
    });

    if (!routeFound) {
      Navigator.of(context).pushReplacementNamed(RouteList.dashboard);
    }
  }

  static void navigateRegister(context, {bool replacement = false}) {
    if (kAdvanceConfig.enableMembershipUltimate) {
      Navigator.of(context).pushNamed(RouteList.memberShipUltimatePlans);
    } else if (kAdvanceConfig.enableWooCommerceWholesalePrices &&
        ServerConfig().isWooPluginSupported) {
      Navigator.of(context).pushNamed(RouteList.wholesaleSignUp);
    } else if (kAdvanceConfig.b2bKingConfig.enabled &&
        ServerConfig().isWooPluginSupported) {
      Navigator.of(context).pushNamed(RouteList.b2bkingSignUp);
    } else if (kAdvanceConfig.enablePaidMembershipPro) {
      Navigator.of(context).pushNamed(RouteList.paidMemberShipProPlans);
    } else if (kAdvanceConfig.enableDigitsMobileLogin) {
      Navigator.of(context).pushNamed(RouteList.digitsMobileLoginSignUp);
    } else {
      if (kLoginSetting.smsLoginAsDefault) {
        navigateToLoginSms(context, replacement: replacement);
        return;
      }
      Navigator.of(context).pushNamed(RouteList.register);
    }
  }

  static void goBackLogin(BuildContext context) {
    var routeFound = false;
    var routeNames = [RouteList.login];

    Navigator.popUntil(context, (route) {
      if (routeNames
          .any((element) => route.settings.name?.contains(element) ?? false)) {
        routeFound = true;
      }
      return routeFound || route.isFirst;
    });

    if (!routeFound) {
      Navigator.of(context).pushReplacementNamed(RouteList.login);
    }
  }
}
