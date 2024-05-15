import 'dart:math';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/expandable/expansion_widget.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../generated/l10n.dart';
import '../../models/entities/filter_sorty_by.dart';
import '../../models/index.dart' show AppModel, BlogModel, ProductModel;
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../services/index.dart';
import '../common/flux_image.dart';
import 'filters/attribute_menu.dart';
import 'filters/category_menu.dart';
import 'filters/container_filter.dart';
import 'filters/listing_menu.dart';
import 'filters/tag_menu.dart';

class BackdropMenu extends StatefulWidget {
  final Function({
    dynamic minPrice,
    dynamic maxPrice,
    List<String>? categoryId,
    String? categoryName,
    List<String>? tagId,
    dynamic listingLocationId,
    FilterSortBy? sortBy,
    bool? isSearch,
  })? onFilter;
  final List<String>? categoryId;
  final List<String>? tagId;
  final String? listingLocationId;
  final bool showCategory;
  final bool showPrice;

  /// Set true in case showing the Blog menu data inside Woo/Vendor app
  /// apply for the dynamic Blog on home screen.
  final bool isUseBlog;
  final bool isBlog;
  final ScrollController? controller;
  final double? minPrice;
  final double? maxPrice;
  final FilterSortBy? sortBy;
  final bool showSort;
  final bool showLayout;
  final bool showTag;
  final bool showAttribute;
  final bool allowMultipleCategory;
  final bool allowMultipleTag;
  final double? minFilterPrice;
  final double? maxFilterPrice;

  final VoidCallback? onApply;

  const BackdropMenu({
    super.key,
    this.onFilter,
    this.categoryId,
    this.tagId,
    this.showCategory = true,
    this.showPrice = true,
    this.isBlog = false,
    this.isUseBlog = false,
    this.listingLocationId,
    this.controller,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.showSort = true,
    this.showLayout = true,
    this.showTag = true,
    this.showAttribute = true,
    this.allowMultipleCategory = false,
    this.allowMultipleTag = false,
    this.onApply,
    this.minFilterPrice,
    this.maxFilterPrice,
  });

  @override
  State<BackdropMenu> createState() => _BackdropMenuState();
}

class _BackdropMenuState extends State<BackdropMenu> {
  double minPrice = 0.0;
  double maxPrice = 0.0;
  List<String>? _categoryId = [];
  List<String>? _tagId;
  FilterSortBy? _currentSortBy;

  AppModel get appModel => context.read<AppModel>();
  ProductModel get productModel => context.read<ProductModel>();
  BlogModel get blogModel => context.read<BlogModel>();

  List<String>? get categoryId =>
      _categoryId ??
      (widget.isUseBlog ? blogModel.categoryIds : productModel.categoryIds);

  List<String>? get tagId =>
      _tagId ?? (widget.isUseBlog ? blogModel.tagIds : productModel.tagIds);

  double get minFilterPrice => min(minPrice, widget.minFilterPrice ?? 0);
  double get maxFilterPrice =>
      max(maxPrice, widget.maxFilterPrice ?? kMaxPriceFilter);

  @override
  void initState() {
    super.initState();
    _categoryId = widget.categoryId;
    minPrice = widget.minPrice ?? 0;
    maxPrice = widget.maxPrice ?? 0;
    _currentSortBy = widget.sortBy;
    _tagId = widget.tagId;

    /// Support loading Blog Category inside Woo/Vendor app
    if (widget.isBlog && widget.isUseBlog) {
      blogModel.getCategoryList();

      /// enable if using Tag, otherwise disable to save performance
      blogModel.getTagList();
    }
  }

  void _onFilter({
    List<String>? categoryId,
    String? categoryName,
    List<String>? tagId,
    bool? isSearch,
    listingLocationId,
  }) =>
      widget.onFilter?.call(
        minPrice: minPrice,
        maxPrice: maxPrice,
        sortBy: _currentSortBy,
        categoryId: categoryId,
        categoryName: categoryName ?? '',
        tagId: tagId,
        isSearch: isSearch,
        listingLocationId: listingLocationId ?? productModel.listingLocationId,
      );

  List<Widget> renderLayout() {
    return [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          S.of(context).layout,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      const SizedBox(height: 5.0),

      /// render layout
      Selector<AppModel, String>(
        selector: (context, AppModel _) => _.productListLayout,
        builder: (context, String selectLayout, _) {
          return Wrap(
            children: <Widget>[
              const SizedBox(width: 8),
              for (var item
                  in widget.isBlog ? kBlogListLayout : kProductListLayout)
                Tooltip(
                  message: item['layout']!,
                  child: GestureDetector(
                    onTap: () =>
                        appModel.updateProductListLayout(item['layout']),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: ContainerFilter(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(
                          bottom: 15,
                          left: 8,
                          right: 8,
                          top: 15,
                        ),
                        isBlog: widget.isBlog,
                        isSelected: selectLayout == item['layout'],
                        child: FluxImage(
                          imageUrl: item['image']!,
                          color: selectLayout == item['layout']
                              ? Theme.of(context).primaryColor
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    ];
  }

  Widget _renderPrice(double price) {
    final currency = appModel.currency;
    final currencyRate = appModel.currencyRate;

    return Text(
      PriceTools.getCurrencyFormatted(price, currencyRate, currency: currency)!,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget renderPriceSlider() {
    var primaryColor = Services().widget.enableProductBackdrop
        ? Colors.white
        : Theme.of(context).primaryColor;

    return ExpansionWidget(
      showDivider: true,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 10,
      ),
      title: Text(
        S.of(context).byPrice,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (minPrice != 0 || maxPrice != 0) ...[
              _renderPrice(minPrice),
              Text(
                ' - ',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
            _renderPrice(maxPrice),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: primaryColor,
            inactiveTrackColor:
                Theme.of(context).primaryColorLight.withOpacity(0.5),
            activeTickMarkColor: Theme.of(context).primaryColorLight,
            inactiveTickMarkColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            overlayColor: primaryColor.withOpacity(0.2),
            thumbColor: primaryColor,
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: RangeSlider(
            min: minFilterPrice,
            max: maxFilterPrice,
            divisions: kFilterDivision,
            values: RangeValues(minPrice, maxPrice),
            onChanged: (RangeValues value) {
              EasyDebounce.cancel('slider');
              setState(() {
                minPrice = value.start;
                maxPrice = value.end;
              });
              EasyDebounce.debounce(
                'slider',
                const Duration(milliseconds: 1000),
                () {
                  _onFilter();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget renderFilterSortBy() {
    if (!widget.showSort) return const SizedBox();

    return Services().widget.renderFilterSortBy(
      context,
      filterSortBy: _currentSortBy,
      showDivider: widget.showLayout,
      isBlog: widget.isBlog,
      onFilterChanged: (filterSortBy) {
        setState(() {
          _currentSortBy = filterSortBy;
        });
        _onFilter();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (Layout.isDisplayDesktop(context))
            SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      if (Layout.isDisplayDesktop(context)) {
                        eventBus.fire(const EventOpenCustomDrawer());
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 22, color: Colors.white70),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    ServerConfig().isWordPress
                        ? context.select((BlogModel _) => _.categoryName) ??
                            S.of(context).blog
                        : S.of(context).products,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

          if (widget.showLayout) ...renderLayout(),

          renderFilterSortBy(),

          if (ServerConfig().isListingType)
            BackDropListingMenu(onFilter: _onFilter),

          if (!ServerConfig().isListingType &&
              ServerConfig().type != ConfigType.shopify &&
              widget.showPrice)
            renderPriceSlider(),

          if (!ServerConfig().isListingType &&
              ServerConfig().type != ConfigType.shopify &&
              widget.showAttribute)
            AttributeMenu(
              onChanged: _onFilter,
            ),

          /// filter by tags
          if (widget.showTag)
            BackDropTagMenu(
              tagId: _tagId,
              isUseBlog: widget.isUseBlog,
              isBlog: widget.isBlog,
              allowMultiple: widget.allowMultipleTag,
              onChanged: (tagId) => _onFilter(tagId: tagId),
            ),

          if (widget.showCategory)
            CategoryMenu(
              categoryId: _categoryId,
              isUseBlog: widget.isUseBlog,
              isBlog: widget.isBlog,
              allowMultiple: widget.allowMultipleCategory,
              onFilter: (category) => _onFilter(
                categoryId: category,
                categoryName: null,
                isSearch: false,
              ),
            ),

          /// render Apply button
          if (!ServerConfig().isListingType &&
              Services().widget.enableProductBackdrop)
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonTheme(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        onPressed: () {
                          _onFilter(
                            categoryId: categoryId,
                            tagId: tagId,
                          );
                          widget.onApply?.call();
                        },
                        child: Text(
                          S.of(context).apply,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
