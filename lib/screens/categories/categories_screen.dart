import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../common/constants.dart';
import '../../custom/helper.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart' show AppModel;
import '../../modules/dynamic_layout/config/product_config.dart';
import '../../modules/dynamic_layout/header/header_text.dart';
import '../../modules/dynamic_layout/product/product_list.dart';
import '../../routes/flux_navigate.dart';
import '../../services/index.dart';
import '../../widgets/cardlist/index.dart';
import '../common/app_bar_mixin.dart';
import 'layouts/card.dart';
import 'layouts/column.dart';
import 'layouts/fancy_scroll.dart';
import 'layouts/grid.dart';
import 'layouts/multi_level.dart';
import 'layouts/parallax.dart';
import 'layouts/side_menu.dart';
import 'layouts/side_menu_with_group.dart';
import 'layouts/side_menu_with_sub.dart';
import 'layouts/sub.dart';

class CategoriesScreen extends StatefulWidget {
  final bool showSearch;
  final bool enableParallax;
  final double? parallaxImageRatio;

  const CategoriesScreen({
    super.key,
    this.showSearch = true,
    this.enableParallax = false,
    this.parallaxImageRatio,
  });

  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen>
    with
        AutomaticKeepAliveClientMixin,
        SingleTickerProviderStateMixin,
        AppBarMixin {
  var customConfig = {
    'showCartIcon': false,
    'imageBoxfit': 'cover',
    'showStockStatus': true,
    'featured': false,
    'hideEmptyProductLayout': false,
    'showCountDown': false,
    'parallax': false,
    'columns': 0,
    'hideStore': false,
    'vPadding': 0,
    'showQuantity': false,
    'showHeart': true,
    'hMargin': 6,
    'parallaxImageRatio': 1.2,
    'showCartButtonWithQuantity': true,
    'vMargin': 0,
    'showOnlyImage': false,
    'onSale': false,
    'productType': false,
    'image': '',
    'showCategory': false,
    'productListItemHeight': 125,
    'showCartIconColor': false,
    'useSort': false,
    'hPadding': 0,
    'hidePrice': false,
    'rows': 1,
    'enableBottomAddToCart': false,
    'layout': 'threeColumn',
    'enableRating': false,
    'imageRatio': 1.2,
    'useCircularRadius': true,
    'hideTitle': false,
    'borderRadius': 3,
    'cardDesign': 'card',
    'backgroundRadius': 10,
    'isSnapping': false,
    'showCartButton': false,
    'name': 'Picked for you',
    'cartIconRadius': 9,
    'enableAutoSliding': false,
    'category': '76',
    'hideEmptyProductListRating': false
  };

  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    screenScrollController = _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final appModel = Provider.of<AppModel>(context);
    final categoryLayout = appModel.categoryLayout;
    return renderScaffold(
      backgroundColor: Colors.white,
      secondAppBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.07,
        title: GestureDetector(
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
            child: const Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    CupertinoIcons.search,
                    size: 24,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Text(
                    style: TextStyle(color: Colors.grey),
                    'Search',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      routeName: RouteList.category,
      child: [
        GridCategory.type,
        ColumnCategories.type,
        SideMenuCategories.type,
        HorizonMenu.type,

        // Not support enableLargeCategory
        // TODO(Son): pls check again, I think it works
        SubCategories.type,

        // Not support enableLargeCategory
        SideMenuSubCategories.type,
        SideMenuGroupCategories.type,

        // Not support enableLargeCategory
        // TODO(Son): pls check again, I think it works
        ParallaxCategories.type,
        CardCategories.type,
        // Only work for enableLargeCategory
        MultiLevelCategories.type,
        FancyScrollCategories.type,
      ].contains(categoryLayout)
          ? Column(
              children: <Widget>[
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 10),
                      child: Text('Shop By Aisles',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  ],
                ),
                Expanded(
                  child: renderCategories(
                    categoryLayout,
                    widget.enableParallax,
                    widget.parallaxImageRatio,
                    _scrollController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Expanded(child:  ProductList(
                  config: ProductConfig.fromJson(customConfig),
                  cleanCache: true,
                ))
              ],
            )
          : renderCategories(
              categoryLayout,
              widget.enableParallax,
              widget.parallaxImageRatio,
              _scrollController,
            ),
    );
  }

  Widget renderCategories(
      String layout, bool enableParallax, double? parallaxImageRatio,
      [ScrollController? scrollController]) {
    return Services().widget.renderCategoryLayout(
          layout: layout,
          enableParallax: enableParallax,
          parallaxImageRatio: parallaxImageRatio,
          scrollController: scrollController,
        );
  }
}
