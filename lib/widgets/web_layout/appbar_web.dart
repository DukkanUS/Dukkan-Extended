import 'dart:developer';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/app_model.dart';
import '../../models/category/category_model.dart';
import '../../models/search_web_model.dart';
import '../../screens/settings/layouts/mixins/setting_action_mixin.dart';
import '../common/flex_separated.dart';
import '../common/flux_image.dart';
import 'web_layout_constant.dart';
import 'web_layout_mixin.dart';
import 'widgets/category_menu_widget.dart';
import 'widgets/my_cart_button_web.dart';
import 'widgets/under_line_widget.dart';

const kStyleTextInAppBarWeb = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 12,
);

class AppBarWeb extends StatefulWidget {
  final bool isPinAppBar;
  final Map<String, dynamic> config;
  final Widget? searchWidget;
  final Widget Function()? actionBuilder;
  final String? searchText;
  final Function()? onRefresh;

  const AppBarWeb({
    super.key,
    this.isPinAppBar = true,
    this.onRefresh,
    this.config = const {},
    this.searchWidget,
    this.actionBuilder,
    this.searchText,
  });

  @override
  State<AppBarWeb> createState() => _AppBarWebState();
}

class _AppBarWebState extends State<AppBarWeb>
    with WebLayoutMixin, SettingActionMixin {
  final _searchCtrl = TextEditingController();
  AppModel get _appModel => context.read<AppModel>();
  void _onOpenAboutUS() => onTapOpenUrl(context,
      _appModel.appConfig?.settings.aboutUS ?? kAdvanceConfig.aboutUSPageUrl);

  void _onOpenFAQ() => onTapOpenUrl(
      context, _appModel.appConfig?.settings.fAQ ?? kAdvanceConfig.faqPageUrl);

  void _onOpenBlog() => onTapOpenUrl(context,
      _appModel.appConfig?.settings.news ?? kAdvanceConfig.newsPageUrl);

  void _onTapLogo() => Navigator.of(context).pushNamed(RouteList.home);

  void _submitSearch(String value) {
    if (AppBarWebControllDelegate.routeName != 'products') {
      log('[tracklog]: submutSearch[ != products]: $value');

      Navigator.of(context)
          .pushNamed(RouteList.products, arguments: {'searchText': value});
    } else {
      log('[tracklog]: submutSearch[ == products]: $value');

      context.read<SearchWebModel>().search(value);
    }
  }

  @override
  void initState() {
    super.initState();
    log('[tracklog]: init AppBarWeb');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryModel>(context, listen: false).getCategories();
      if (widget.searchText?.isNotEmpty ?? false) {
        log('[tracklog]: set searchText: ${widget.searchText}');

        _searchCtrl.text = widget.searchText!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorAppBar = Theme.of(context).appBarTheme.backgroundColor ??
        Theme.of(context).colorScheme.background;

    final appModel = Provider.of<AppModel>(context, listen: false);

    final themeConfig = appModel.themeConfig;

    final style = Theme.of(context)
        .textTheme
        .labelLarge
        ?.copyWith(fontWeight: FontWeight.w700);

    return Container(
      color: colorAppBar,
      child: Center(
        child: Container(
          height: WebLayoutConstant.kHeightAppBarWeb,
          color: colorAppBar,
          child: SizedBox(
            height: WebLayoutConstant.kHeightContentAppBar,
            child: LayoutBuilder(
              builder: (_, constrain) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Row(
                    children: [
                      InkWell(
                        hoverColor: Colors.transparent,
                        onTap: _onTapLogo,
                        child: SizedBox(
                          height: WebLayoutConstant.kHeightContentAppBar,
                          width: constrain.maxWidth * 0.1,
                          child: FluxImage(
                            imageUrl: themeConfig.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      if (widget.actionBuilder != null)
                        Expanded(child: widget.actionBuilder!())
                      else ...[
                        SizedBox(
                          height: WebLayoutConstant.kHeightContentAppBar,
                          child: FlexSeparated.row(
                            separationSize: 24,
                            children: [
                              const CategoriesOverlayButton(),
                              UnderlineWidget(
                                onTap: _onOpenAboutUS,
                                child: Text(
                                  S.of(context).aboutUs,
                                  style: style,
                                ),
                              ),
                              UnderlineWidget(
                                onTap: _onOpenBlog,
                                child: Text(
                                  S.of(context).blog,
                                  style: style,
                                ),
                              ),
                              UnderlineWidget(
                                onTap: _onOpenFAQ,
                                child: Text(
                                  'FAQ',
                                  style: style,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        _SearchWebWidget(
                          controller: _searchCtrl,
                          width: constrain.maxWidth * 0.2,
                          height: WebLayoutConstant.kHeightButtonAction,
                          onFieldSubmitted: _submitSearch,
                          onChanged: (p0) {
                            EasyDebounce.debounce(
                                'searchWeb', const Duration(milliseconds: 800),
                                () {
                              _submitSearch(p0);
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(RouteList.wishlist),
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            height: WebLayoutConstant.kHeightButtonAction,
                            width: WebLayoutConstant.kHeightButtonAction,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                              ),
                              borderRadius: BorderRadius.circular(
                                  WebLayoutConstant.kHeightButtonAction),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: const Icon(
                              CupertinoIcons.heart,
                              size: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const MyCartButtonWebWidget(),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchWebWidget extends StatelessWidget {
  const _SearchWebWidget({
    this.width = 200,
    this.height = 44,
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
  });

  final double width;
  final double height;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 44,
            width: 44,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero.copyWith(bottom: 5),
                border: InputBorder.none,
                hintText: S.of(context).searchForItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWebControllDelegate {
  static void emitRoute(String? route) {
    _routeName = route;
  }

  static AppBarWebControllDelegate? _instance;

  static String? _routeName;
  static String? get routeName => _routeName;

  factory AppBarWebControllDelegate() {
    return _instance ??= AppBarWebControllDelegate._();
  }

  AppBarWebControllDelegate._();
}
