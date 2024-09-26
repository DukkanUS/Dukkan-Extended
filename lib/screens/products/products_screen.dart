import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools/navigate_tools.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart'
    show AppModel, CartModel, CategoryModel, FilterAttributeModel, Product, ProductModel, ProductPriceModel, TagModel, UserModel;
import '../../models/search_web_model.dart';
import '../../modules/analytics/analytics.dart';
import '../../modules/dynamic_layout/helper/countdown_timer.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../modules/dynamic_layout/index.dart';
import '../../services/index.dart';
import '../../widgets/asymmetric/asymmetric_view.dart';
import '../../widgets/backdrop/backdrop.dart';
import '../../widgets/backdrop/backdrop_menu.dart';
import '../../widgets/product/product_bottom_sheet.dart';
import '../../widgets/product/product_list.dart';
import '../common/app_bar_mixin.dart';
import 'filter_mixin/products_filter_mixin.dart';
import 'products_backdrop.dart';
import 'products_flatview.dart';
import 'products_mixin.dart';
import 'products_screen_web.dart';
import 'widgets/category_menu.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product>? products;
  final ProductConfig? config;
  final Duration countdownDuration;
  final bool enableSearchHistory;
  final String? routeName;
  final bool autoFocusSearch;
  final String? searchText;

  const ProductsScreen({
    super.key,
    this.products,
    this.config,
    this.countdownDuration = Duration.zero,
    this.enableSearchHistory = false,
    this.routeName,
    this.searchText,
    this.autoFocusSearch = true,
  });

  @override
  Widget build(BuildContext context) {
    if (Layout.isDisplayDesktop(context)) {
      return ChangeNotifierProvider(
        create: (context) => SearchWebModel(searchText),
        child: ProductsScreenWeb(
          products: products,
          config: config,
          countdownDuration: countdownDuration,
          enableSearchHistory: enableSearchHistory,
          routeName: routeName,
          autoFocusSearch: autoFocusSearch,
        ),
      );
    }

    return ProductsScreenMobile(
      products: products,
      config: config,
      countdownDuration: countdownDuration,
      enableSearchHistory: enableSearchHistory,
      routeName: routeName,
      autoFocusSearch: autoFocusSearch,
    );
  }
}

class ProductsScreenMobile extends StatefulWidget {
  final List<Product>? products;
  final ProductConfig? config;
  final Duration countdownDuration;
  final bool enableSearchHistory;
  final String? routeName;
  final bool autoFocusSearch;

  const ProductsScreenMobile({
    this.products,
    this.countdownDuration = Duration.zero,
    this.config,
    this.enableSearchHistory = false,
    this.routeName,
    this.autoFocusSearch = true,
  });

  @override
  State<ProductsScreenMobile> createState() {
    return _ProductsScreenMobileState();
  }
}

class _ProductsScreenMobileState extends State<ProductsScreenMobile>
    with
        SingleTickerProviderStateMixin,
        AppBarMixin,
        ProductsMixin,
        ProductsFilterMixin {
  late AnimationController _controller;
  final _searchFieldController = TextEditingController();

  bool get hasAppBar => showAppBar(widget.routeName ?? RouteList.backdrop);

  ProductConfig get productConfig => widget.config ?? ProductConfig.empty();

  @override
  bool get enableSearchHistory => widget.enableSearchHistory;

  @override
  CategoryModel get categoryModel =>
      Provider.of<CategoryModel>(context, listen: false);

  @override
  TagModel get tagModel => Provider.of<TagModel>(context);

  ProductModel get productModel =>
      Provider.of<ProductModel>(context, listen: false);

  @override
  FilterAttributeModel get filterAttrModel =>
      Provider.of<FilterAttributeModel>(context, listen: false);

  @override
  ProductPriceModel get productPriceModel => context.read<ProductPriceModel>();

  UserModel get userModel => Provider.of<UserModel>(context, listen: false);

  AppModel get appModel => Provider.of<AppModel>(context, listen: false);

  /// Image ratio from Product Cart
  double get ratioProductImage => appModel.ratioProductImage;

  double get productListItemHeight => kProductDetail.productListItemHeight;

  bool get enableProductBackdrop => kAdvanceConfig.enableProductBackdrop;

  bool get showBottomCornerCart => kAdvanceConfig.showBottomCornerCart;

  List<Product>? products = [];
  String? errMsg;

  String _currentTitle = '';

  String get currentTitle =>
      search != null ? S.of(context).results : _currentTitle;

  StreamSubscription? _streamSubscription;

  bool get allowMultipleCategory => ServerConfig().allowMultipleCategory;

  bool get allowMultipleTag => ServerConfig().allowMultipleTag;

  @override
  void initState() {
    super.initState();
    _initFilter();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );

    Analytics.triggerViewListProduct(widget.products, context);

    /// only request to server if there is empty config params
    // / If there is config, load the products one
  }

  void _initFilter() {
    WidgetsBinding.instance.endOfFrame.then((_) async {
      await initFilter(config: productConfig);

      if (mounted) {
        _streamSubscription =
            eventBus.on<EventRefreshProductsList>().listen((event) {
          onRefresh();
        });
        resetFilter();
        await onRefresh();
      }
    });
  }

  String _countItemText(int length) {
    if (length == 1) {
      return S.of(context).countItem(length);
    }
    return S.of(context).countItems(length);
  }

  @override
  void clearProductList() {
    productModel.setProductsList([]);
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Future<void> getProductList({bool forceLoad = false}) async {
    await productModel.getProductsList(
      boostEngine: widget.config?.boostEngine,
      categoryId: categoryIds,
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      lang: appModel.langCode,
      orderBy: filterSortBy.orderByType?.name,
      order: filterSortBy.orderType?.name,
      featured: filterSortBy.featured,
      onSale: filterSortBy.onSale,
      tagId: tagIds,
      attribute: attribute,
      attributeTerm: getAttributeTerm(),
      userId: userModel.user?.id,
      listingLocation: listingLocationId,
      include: include,
      search: search,
    );
    Analytics.triggerSearchProduct(
      search,
      productModel.products.isEmpty,
      context,
    );
  }

  ProductBackdrop backdrop({
    products,
    isFetching,
    errMsg,
    isEnd,
    width,
    required String layout,
  }) {
    return ProductBackdrop(
      backdrop: Backdrop(
        hasAppBar: hasAppBar,
        bgColor: productConfig.backgroundColor,
        frontLayer: layout.isListView
            ? ProductList(
                products: products,
                onRefresh: onRefresh,
                onLoadMore: onLoadMore,
                isFetching: isFetching,
                errMsg: errMsg,
                isEnd: isEnd,
                layout: layout,
                ratioProductImage: ratioProductImage,
                productListItemHeight: productListItemHeight,
                width: width,
              )
            : AsymmetricView(
                products: products,
                isFetching: isFetching,
                isEnd: isEnd,
                onLoadMore: onLoadMore,
                width: width),
        backLayer: BackdropMenu(
          onFilter: onFilter,
          categoryId: categoryIds,
          tagId: tagIds,
          sortBy: filterSortBy,
          listingLocationId: listingLocationId,
          onApply: onCloseFilter,
          allowMultipleCategory: allowMultipleCategory,
          allowMultipleTag: allowMultipleTag,
          minFilterPrice: productPriceModel.minFilterPrice,
          maxFilterPrice: productPriceModel.maxFilterPrice,
        ),
        frontTitle: productConfig.showCountDown
            ? Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentTitle),
                      CountDownTimer(widget.countdownDuration)
                    ],
                  ),
                ],
              )
            : Text(currentTitle),
        backTitle: Center(child: Text(S.of(context).filter)),
        controller: _controller,
        appbarCategory: ProductCategoryMenu(
          enableSearchHistory: widget.enableSearchHistory,
          selectedCategories: categoryIds,
          onTap: onTapProductCategoryMenu,
        ),
        onTapShareButton: () async {
          await shareProductsLink(context);
        },
      ),
      expandingBottomSheet: (Services().widget.enableShoppingCart(null) &&
              !ServerConfig().isListingType &&
              kAdvanceConfig.showBottomCornerCart)
          ? ExpandingBottomSheet(hideController: _controller)
          : null,
    );
  }

  void onTapProductCategoryMenu(String? categoryId) {
    // Reset included products
    include = null;

    if (categoryIds?.contains(categoryId) ?? false) {
      categoryIds?.remove(categoryId);
    } else if (categoryId != null) {
      // `ProductCategoryMenu` will be hidden if the selected category number is
      // not equal to 1. Some users do not want this behavior when they select
      // another category item in the list. Therefore, here only a single
      // category filter will be applied. If they want to filter multiple
      // categories on supported platforms, the only way is to open the filter
      // screen.

      // if (allowMultipleCategory) {
      //   categoryIds?.add(categoryId);
      // } else {
      categoryIds = [categoryId];
      // }
    }

    onFilter(categoryId: categoryIds);
  }

  @override
  Widget build(BuildContext context) {
    _currentTitle = productConfig.name ??
        productModel.categoryName ??
        S.of(context).results;

    Widget buildMain = LayoutBuilder(
      builder: (context, constraint) {
        return FractionallySizedBox(
          widthFactor: 1.0,
          child: Selector<AppModel, String>(
            selector: (context, provider) => provider.productListLayout,
            builder: (context, productListLayout, child) {
              /// override the layout to listTile if enableSearchUX
              /// otherwise, using default productListLayout from the Config
              var layout = widget.enableSearchHistory
                  ? Layout.simpleList
                  : productListLayout;

              return ListenableProvider.value(
                value: productModel,
                child: Consumer<ProductModel>(
                  builder: (context, model, child) {
                    var backdropLayout = enableProductBackdrop;

                    if (!backdropLayout) {
                      return ProductFlatView(
                        searchFieldController: _searchFieldController,
                        hasAppBar: hasAppBar,
                        autoFocusSearch: widget.autoFocusSearch,
                        enableSearchHistory: widget.enableSearchHistory,
                        builder: layout.isListView
                            ? ProductList(
                                products: model.productsList,
                                onRefresh: onRefresh,
                                onLoadMore: onLoadMore,
                                isFetching: model.isFetching,
                                errMsg: model.errMsg,
                                isEnd: model.isEnd,
                                layout: layout,
                                ratioProductImage: ratioProductImage,
                                productListItemHeight: productListItemHeight,
                                width: constraint.maxWidth,
                                useCustomAppBar: true,
                                appbar: SliverAppBar(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    toolbarHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.07,
                                    primary: true,
                                    titleSpacing: 0,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    leading: Navigator.of(context).canPop()
                                        ? CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.back,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          )
                                        : null,
                                    title: Padding(
                                      padding: EdgeInsets.only(
                                          left: Navigator.of(context).canPop()
                                              ? 0
                                              : 15),
                                      child: CupertinoSearchTextField(
                                        backgroundColor: Colors.white,
                                        controller: _searchFieldController,
                                        onChanged: (String searchText) => {
                                          onFilter(
                                            minPrice: minPrice,
                                            maxPrice: maxPrice,
                                            categoryId: categoryIds,
                                            tagId: tagIds,
                                            listingLocationId:
                                                listingLocationId,
                                            search: searchText,
                                            isSearch: true,
                                          )
                                        },
                                        onSubmitted: (String searchText) => {
                                          onFilter(
                                            minPrice: minPrice,
                                            maxPrice: maxPrice,
                                            categoryId: categoryIds,
                                            tagId: tagIds,
                                            listingLocationId:
                                                listingLocationId,
                                            search: searchText,
                                            isSearch: true,
                                          )
                                        },
                                        placeholder:
                                            S.of(context).searchForItems,
                                        style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            shareProductsLink(context);
                                          },
                                          icon: const Icon(
                                            Icons.share,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      renderFilters(
                                        context,
                                        allowMultipleCategory:
                                            allowMultipleCategory,
                                        allowMultipleTag: allowMultipleTag,
                                      )
                                    ]),
                                header: [
                                  ProductCategoryMenu(
                                    imageLayout: true,
                                    enableSearchHistory:
                                        widget.enableSearchHistory,
                                    selectedCategories: categoryIds,
                                    onTap: onTapProductCategoryMenu,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 25),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                currentTitle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                            const Spacer(),
                                            if ((model.productsList?.length ??
                                                    0) >
                                                0) ...[
                                              Text(
                                                _countItemText(
                                                    model.productsList!.length),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                              ),
                                              const SizedBox(width: 5),
                                            ]
                                          ],
                                        ),
                                        if (productConfig.showCountDown) ...[
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                S
                                                    .of(context)
                                                    .endsIn('')
                                                    .toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.8),
                                                    )
                                                    .apply(fontSizeFactor: 0.6),
                                              ),
                                              CountDownTimer(
                                                  widget.countdownDuration),
                                            ],
                                          ),
                                        ],
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : AsymmetricView(
                                products: model.productsList,
                                isFetching: model.isFetching,
                                isEnd: model.isEnd,
                                onLoadMore: onLoadMore,
                                width: constraint.maxWidth),
                        titleFilter: layout.isListView
                            ? null
                            : renderFilters(
                                context,
                                allowMultipleCategory: allowMultipleCategory,
                                allowMultipleTag: allowMultipleTag,
                              ),
                        onFilter: onFilter,
                        onSearch: (String searchText) => {
                          onFilter(
                            minPrice: minPrice,
                            maxPrice: maxPrice,
                            categoryId: categoryIds,
                            tagId: tagIds,
                            listingLocationId: listingLocationId,
                            search: searchText,
                            isSearch: true,
                          )
                        },
                        bottomSheet: (Services()
                                    .widget
                                    .enableShoppingCart(null) &&
                                !ServerConfig().isListingType &&
                                showBottomCornerCart)
                            ? ExpandingBottomSheet(hideController: _controller)
                            : null,
                      );
                    }
                    return backdrop(
                      products: model.productsList,
                      isFetching: model.isFetching,
                      errMsg: model.errMsg,
                      isEnd: model.isEnd,
                      width: constraint.maxWidth,
                      layout: layout,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );

    buildMain = renderScaffold(
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
      routeName: widget.routeName ?? RouteList.backdrop,
      child: buildMain,
      resizeToAvoidBottomInset: false,
      disableSafeArea: true,
    );

    return kIsWeb
        ? WillPopScopeWidget(
            onWillPop: () async {
              eventBus.fire(const EventOpenCustomDrawer());
              // LayoutWebCustom.changeStateMenu(true);
              Navigator.of(context).pop();
              return false;
            },
            child: buildMain,
          )
        : buildMain;
  }

  @override
  String get lang => appModel.langCode;

  @override
  void onCategorySelected(String? name) {
    productModel.categoryName = name;
    _currentTitle = (name?.isNotEmpty ?? false) ? name! : S.of(context).results;
  }

  @override
  void onCloseFilter() {
    _controller.forward();
  }

  @override
  void rebuild() {
    setState(() {});
  }

  @override
  void onClearTextSearch() {
    _searchFieldController.clear();
  }
}
