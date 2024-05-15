import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/app_model.dart';
import '../common/flex_separated.dart';
import '../common/flux_image.dart';
import 'mixins/overlay_mixin.dart';
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
  final Function()? onRefresh;

  const AppBarWeb({
    super.key,
    this.isPinAppBar = true,
    this.onRefresh,
    this.config = const {},
    this.searchWidget,
    this.actionBuilder,
  });

  @override
  State<AppBarWeb> createState() => _AppBarWebState();
}

class _AppBarWebState extends State<AppBarWeb>
    with WebLayoutMixin, SingleTickerProviderStateMixin, OverlayMixin {
  final _globalKey = GlobalKey<_AppBarWebState>();
  final _globalKeySearch = GlobalKey();
  final _textCtrl = TextEditingController();
  final _focusNode = FocusNode();

  late AnimationController _controller;
  late Animation<double> _animation;

  void _onOpenAboutUS() =>
      onTapOpenUrl(context, 'https://inspireui.com/about/');

  void _onOpenFAQ() =>
      onTapOpenUrl(context, 'https://support.inspireui.com/help-center');

  void _onOpenBlog() => onTapOpenUrl(context, 'https://medium.com/@inspireui');

  void _onTapLogo() => Navigator.of(context).pushNamedAndRemoveUntil(
        RouteList.home,
        (route) => false,
      );

  void _listenerFocusText() {
    if (_focusNode.hasFocus) {
      _controller.forward().then((value) {
        showOverlay();
      });
    } else {
      _controller.reverse();
      hideOverlay();
    }
  }

  @override
  double? get offsetLeft => 0.0;

  @override
  double? get offsetRight => 0.0;

  @override
  double? get offsetTop => 20;

  @override
  Widget get bodyOverlay {
    if (_globalKeySearch.currentContext == null) {
      return const SizedBox();
    }

    final box =
        _globalKeySearch.currentContext!.findRenderObject() as RenderBox;
    final sizeWidget = box.size;
    final posWidget = box.localToGlobal(Offset.zero);

    log('======>> $posWidget --- $sizeWidget');

    return SearchRecentWidget(
      posWidget: posWidget,
      onPop: hideOverlay,
    );
  }

  @override
  // TODO: implement globalKeyOverlay
  GlobalKey<State<StatefulWidget>>? get globalKeyOverlay => _globalKey;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _focusNode.addListener(_listenerFocusText);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_listenerFocusText);
    _controller.dispose();
    _textCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
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
      key: _globalKey,
      child: Center(
        child: Container(
          height: WebLayoutConstant.kHeightAppBarWeb,
          color: colorAppBar,
          child: SizedBox(
            height: WebLayoutConstant.kHeightContentAppBar,
            child: LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth - 100.0;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: AnimatedBuilder(
                      animation: _animation,
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: _onTapLogo,
                        child: SizedBox(
                          height: WebLayoutConstant.kHeightContentAppBar,
                          width: maxWidth * 0.1,
                          child: FluxImage(
                            imageUrl: themeConfig.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      builder: (context, child) {
                        return Row(
                          children: [
                            child!,
                            const SizedBox(width: 24),
                            if (widget.actionBuilder != null)
                              Expanded(child: widget.actionBuilder!())
                            else ...[
                              Opacity(
                                opacity: 1 - _animation.value,
                                child: SizedBox(
                                  width:
                                      maxWidth * 0.45 * (1 - _animation.value),
                                  height:
                                      WebLayoutConstant.kHeightContentAppBar,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
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
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: maxWidth * 0.15 * _animation.value,
                                height: 1,
                              ),
                              _SearchWebWidget(
                                key: _globalKeySearch,
                                width: maxWidth * 0.2 +
                                    (maxWidth * 0.35 * _animation.value),
                                controller: _textCtrl,
                                focusNode: _focusNode,
                                height: WebLayoutConstant.kHeightButtonAction,
                              ),
                              const SizedBox(width: 12),
                              Opacity(
                                opacity: 1 - _animation.value,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed(RouteList.wishlist),
                                        behavior: HitTestBehavior.translucent,
                                        child: Container(
                                          height: WebLayoutConstant
                                              .kHeightButtonAction,
                                          width: WebLayoutConstant
                                              .kHeightButtonAction,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey[300]!,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                WebLayoutConstant
                                                    .kHeightButtonAction),
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
                                  ),
                                ),
                              )
                            ],
                          ],
                        );
                      }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchRecentWidget extends StatefulWidget {
  const SearchRecentWidget({
    super.key,
    required this.posWidget,
    this.onPop,
  });

  final Offset posWidget;
  final void Function()? onPop;

  @override
  State<SearchRecentWidget> createState() => _SearchRecentWidgetState();
}

class _SearchRecentWidgetState extends State<SearchRecentWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    WidgetsBinding.instance.endOfFrame.then((value) {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.grey),
          ),
          padding: EdgeInsets.only(left: widget.posWidget.dx),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1234567890123456789'),
              Text('1234567890123456789'),
              Text('1234567890123456789'),
              Text('1234567890123456789'),
            ],
          ),
        ),
        GestureDetector(
          onTap: widget.onPop,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: child,
              );
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 3000,
              decoration: const BoxDecoration(color: Colors.black26),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchWebWidget extends StatelessWidget {
  const _SearchWebWidget({
    this.width = 200,
    this.height = 44,
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final double width;
  final double height;
  final TextEditingController controller;
  final FocusNode focusNode;

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
              focusNode: focusNode,
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
