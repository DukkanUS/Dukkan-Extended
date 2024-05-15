part of 'products_filter_mixin.dart';

extension ProductsFilterMixinWidgetExtension on ProductsFilterMixin {
  Widget renderFilters(
    BuildContext context, {
    Widget? title,
    bool showCategory = true,
    bool showPrice = true,
    bool showTag = true,
    Widget? trailingWidget,
    bool allowMultipleCategory = false,
    bool allowMultipleTag = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: title ?? renderFilterTitle(context),
        ),
        if (trailingWidget == null) ...[
          const SizedBox(width: 5),
          const SizedBox(
            height: 44,
            child: VerticalDivider(
              width: 15,
              indent: 8,
              endIndent: 8,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 5),
        ],
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: trailingWidget ??
              Row(
                children: [
                  Text(S.of(context).filter,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(width: 4),
                  const Icon(CupertinoIcons.chevron_down, size: 13),
                ],
              ),
          onPressed: () => showModalBottomSheet(
            context: App.fluxStoreNavigatorKey.currentContext!,
            isScrollControlled: true,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Stack(
              children: [
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Container(color: Colors.transparent),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.2,
                  maxChildSize: 0.9,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Stack(
                            children: [
                              const DragHandler(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BackdropMenu(
                                  onFilter: onFilter,
                                  categoryId: categoryIds,
                                  sortBy: filterSortBy,
                                  tagId: tagIds,
                                  listingLocationId: listingLocationId,
                                  controller: scrollController,
                                  minPrice: minPrice,
                                  maxPrice: maxPrice,

                                  /// hide layout filter from Search screen
                                  showLayout: shouldShowLayout,
                                  showCategory: showCategory,
                                  showPrice: showPrice,
                                  showTag: showTag,

                                  onApply: onCloseFilter,
                                  allowMultipleCategory: allowMultipleCategory,
                                  allowMultipleTag: allowMultipleTag,

                                  minFilterPrice:
                                      productPriceModel.minFilterPrice,
                                  maxFilterPrice:
                                      productPriceModel.maxFilterPrice,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        if (trailingWidget == null) const SizedBox(width: 5),
      ],
    );
  }

  Widget renderFilterTitle(BuildContext context) {
    final lstCurrentSelectedTerms = filterAttrModel.lstCurrentSelectedTerms;
    var appModel = context.read<AppModel>();
    final currency = appModel.currency;
    final currencyRate = appModel.currencyRate;
    var attributeName = '';

    if (filterAttrModel.indexSelectedAttr >= 0) {
      attributeName = listProductAttribute[filterAttrModel.indexSelectedAttr]
              .name
              ?.capitalize() ??
          '';
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _renderFilterSortByTag(context),
          const SizedBox(width: 5),
          if (lstCurrentSelectedTerms.isNotEmpty &&
              filterAttrModel.indexSelectedAttr >= 0)
            for (int i = 0; i < lstCurrentSelectedTerms.length; i++)
              if (lstCurrentSelectedTerms[i] == true)
                FilterLabel(
                  label:
                      '${attributeName.isNotEmpty ? '$attributeName: ' : ''}${filterAttrModel.lstCurrentAttr[i].name ?? ''}',
                  onTap: () {
                    filterAttrModel.updateAttributeSelectedItem(i, false);

                    onFilter();
                  },
                ),
          if (tagIds?.isNotEmpty ?? false)
            ...List.generate(
              tagIds!.length,
              (index) {
                final id = tagIds![index];
                final tagName = tagModel.getTagName(id).capitalize();
                return FilterLabel(
                  label: '#$tagName',
                  onTap: () {
                    tagIds?.removeWhere((element) => element == id);
                    onFilter(tagId: tagIds);
                  },
                );
              },
            ),
          if (minPrice != null && maxPrice != null && maxPrice != 0)
            FilterLabel(
              onTap: () {
                resetPrice();
                onFilter(minPrice: 0.0, maxPrice: 0.0);
              },
              label:
                  '${PriceTools.getCurrencyFormatted(minPrice, currencyRate, currency: currency)!} - ${PriceTools.getCurrencyFormatted(maxPrice, currencyRate, currency: currency)!}',
            ),
        ],
      ),
    );
  }

  Widget _renderFilterSortByTag(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (filterSortBy.displaySpecial != null)
          FilterLabel(
            label: filterSortBy.displaySpecial!,
            onTap: () {
              filterSortBy = filterSortBy.applyOnSale(null).applyFeatured(null);
              onFilter();
            },
            leading: filterSortBy.onSale ?? false
                ? Icon(
                    CupertinoIcons.tag_solid,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(
                    CupertinoIcons.star_circle_fill,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
          ),
        if (filterSortBy.displayOrderBy != null)
          FilterLabel(
            label: filterSortBy.displayOrderBy!,
            icon: filterSortBy.orderType == null
                ? null
                : (filterSortBy.orderType!.isAsc
                    ? Icon(
                        CupertinoIcons.sort_up,
                        size: 20,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      )
                    : Icon(
                        CupertinoIcons.sort_down,
                        size: 20,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      )),
            onTap: () {
              filterSortBy = filterSortBy.applyOrder(null).applyOrderBy(null);
              onFilter();
            },
          ),
      ],
    );
  }
}
