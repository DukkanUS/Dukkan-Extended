import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants.dart';
import '../../../../data/boxes.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/notification_model.dart';
import '../../../../models/user_model.dart';
import '../../../../routes/flux_navigate.dart';
import '../../../../services/service_config.dart';
import '../../../common/delete_account_mixin.dart';
import '../../../index.dart';
import '../../../order_history/views/order_history_detail_screen.dart';
import '../mixins/branch_mixin.dart';
import '../mixins/setting_nomarl_mixin.dart';
import '../setting_builder_layout.dart';

class SettingLayoutNormalWidget extends StatefulWidget {
  const SettingLayoutNormalWidget({
    super.key,
    required this.dataSettings,
  });

  final DataSettingScreen dataSettings;

  @override
  State<SettingLayoutNormalWidget> createState() =>
      _SettingLayoutNormalWidgetState();
}

class _SettingLayoutNormalWidgetState extends State<SettingLayoutNormalWidget>
    with DeleteAccountMixin, SettingNormalMixin, BranchMixin {
  @override
  DataSettingScreen get dataSettings => widget.dataSettings;

  @override
  BuildContext get buildContext => context;

  @override
  ScrollController get scrollController => PrimaryScrollController.of(context);
  bool isLoggedIn = UserBox().isLoggedIn;

  void _handleUpdateProfile() async {
    await FluxNavigate.pushNamed(
      RouteList.updateUser,
    ) as bool?;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // appBarWidget,
        // Items

        SliverAppBar(
          toolbarHeight: (isLoggedIn) ? MediaQuery.sizeOf(context).height * .18 : MediaQuery.sizeOf(context).height * .14 ,
          pinned: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: (isLoggedIn) ? MediaQuery.sizeOf(context).height * .16 : MediaQuery.sizeOf(context).height * .12,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (isLoggedIn)? Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: GestureDetector(
                          onTap: () {
                            _handleUpdateProfile();
                          },
                          child: Row(
                            children: [
                              Text(
                                'Welcome ${Provider.of<UserModel>(context).user?.firstName}!',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          ),
                        ),
                      ) :const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context)
                      .width, // Giving the Row a finite width
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // Ensuring Row only takes needed space
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (isLoggedIn) {
                            await FluxNavigate.pushNamed(
                              RouteList.orders,
                              arguments:
                                  Provider.of<UserModel>(context, listen: false)
                                      .user,
                            );
                          } else {
                            await Navigator.of(context)
                                .pushNamed(RouteList.login);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(.1)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 80,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/tabs/Paper.png',color: Theme.of(context).primaryColor),
                              Text(S.of(context).orders)
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (isLoggedIn) {
                            await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      NotificationScreen(),
                                ));
                          } else {
                            await Navigator.of(context)
                                .pushNamed(RouteList.login);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(.1)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 80,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (Provider.of<NotificationModel>(context,
                                              listen: false)
                                          .unreadCount >
                                      0)
                                  ? SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Stack(children: [
                                         Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child:
                                                Icon(Icons.notifications_none,color: Theme.of(context).primaryColor)),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                Provider.of<NotificationModel>(
                                                        context)
                                                    .unreadCount
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    )
                                  :  Icon(Icons.notifications_none,color: Theme.of(context).primaryColor),
                              Text(S.of(context).notifications)
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          log('message');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(.1)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 80,
                          width: 110,
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.help,color: Theme.of(context).primaryColor), const Text('help')],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (userInfoWidget != null)
                      userInfoWidget!
                    else
                      const SizedBox.shrink(),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).generalSetting,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              Container(
                margin: marginHorizontalItemDynamic,
                decoration: decoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Vendor
                    vendorAdminWidget,

                    /// Branch
                    branchWidget,

                    /// Render some extra menu for Vendor.
                    /// Currently support WCFM & Dokan. Will support WooCommerce soon.
                    ...someExtraMenuForVendorWidget,

                    deliveryBoyWidget,

                    /// Render custom Wallet feature
                    // webViewProfileWidget,

                    /// render some extra menu for Listing
                    ...settingListingWidget,

                    /// render list of dynamic menu
                    /// this could be manage from the Fluxbuilder
                    ...listDynamicItems,

                    /// Delete account
                    if (deleteAccountItem != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: itemPadding),
                        child: deleteAccountItem,
                      ),
                  ],
                ),
              ),
              if (logoutItemWidget != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 20),
                  child: logoutItemWidget,
                ),
              const SizedBox(height: 180),
            ],
          ),
        ),
      ],
    );
  }
}
