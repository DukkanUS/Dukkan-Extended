import 'package:flutter/material.dart';
import 'package:inspireui/widgets/expandable/expansion_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/index.dart'
    show BlogModel, Category, CategoryModel, ProductModel;
import '../../common/tree_view.dart';
import 'category_item.dart';

class CategoryMenu extends StatefulWidget {
  final Function(List<String> category) onFilter;
  final bool isUseBlog;
  final List<String>? categoryId;
  final bool isBlog;
  final bool allowMultiple;
  final bool useExpansionStyle;

  final EdgeInsets? paddingItem;
  final EdgeInsets? marginItem;
  const CategoryMenu({
    super.key,
    required this.onFilter,
    this.isUseBlog = false,
    this.categoryId,
    this.isBlog = false,
    this.allowMultiple = false,
    this.useExpansionStyle = true,
    this.paddingItem,
    this.marginItem,
  });

  @override
  State<CategoryMenu> createState() => _CategoryTreeState();
}

class _CategoryTreeState extends State<CategoryMenu> {
  ProductModel get productModel => context.read<ProductModel>();
  BlogModel get blogModel => context.read<BlogModel>();

  List<String>? get categoryId =>
      widget.isUseBlog ? blogModel.categoryIds : productModel.categoryIds;

  List<String> _categoryId = [];

  // Store category id from parent to children
  List<String?> selectedCategoryTree = [];

  @override
  void initState() {
    _categoryId = widget.categoryId ?? categoryId ?? [];
    super.initState();
  }

  bool hasChildren(categories, id) {
    if (categories == null) return false;

    return categories.where((o) => o.parent == id).isNotEmpty;
  }

  List<Category> getSubCategories(categories, id) {
    if (categories == null) return [];

    if (id == null) {
      return categories.where((item) => item.isRoot == true).toList();
    }

    return categories.where((o) => o.parent == id).toList();
  }

  void onTap(Category category) {
    final id = category.id;
    if (_categoryId.any((element) => element == id)) {
      _categoryId.removeWhere((element) => element == id);
      widget.onFilter(_categoryId);
      selectedCategoryTree.clear();
      setState(() {});
      return;
    }

    var indexOfCate = selectedCategoryTree.indexOf(category.parent);
    if (indexOfCate != -1) {
      selectedCategoryTree.removeRange(
          indexOfCate, selectedCategoryTree.length);
    } else {
      selectedCategoryTree.clear();
    }
    if (widget.allowMultiple) {
      _categoryId.add(id!);
    } else {
      _categoryId = [id!];
    }
    widget.onFilter(_categoryId);
    setState(() {});
  }

  List<Parent> _getCategoryItems(
    List<Category>? categories, {
    String? id,
    required Function onFilter,
    int level = 1,
  }) {
    var subTree = <Parent>[];

    for (var category in getSubCategories(categories, id)) {
      var subCategories = _getCategoryItems(
        categories,
        id: category.id,
        onFilter: widget.onFilter,
        level: level + 1,
      );

      if (_categoryId.contains(category.id) ||
          selectedCategoryTree.contains(category.id)) {
        selectedCategoryTree.insert(0, category.parent);
      }

      subTree.add(Parent(
        parent: CategoryItem(
          category,
          padding: widget.paddingItem,
          margin: widget.marginItem,
          hasChild: hasChildren(categories, category.id),
          isSelected: _categoryId.contains(category.id),
          isParentOfSelected: selectedCategoryTree.contains(category.id),
          onTap: () => onTap(category),
          level: level,
          isBlog: widget.isBlog,
        ),
        childList: ChildList(
          children: [
            if (hasChildren(categories, category.id))
              CategoryItem(
                category,
                isParent: true,
                padding: widget.paddingItem,
                margin: widget.marginItem,
                isSelected: _categoryId.contains(category.id),
                onTap: () => onTap(category),
                level: level + 1,
              ),
            ...subCategories,
          ],
        ),
      ));
    }

    return subTree;
  }

  Widget getTreeView({required List<Category> categories}) {
    return TreeView(
      parentList: _getCategoryItems(
        categories,
        onFilter: widget.onFilter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuCategory = Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: widget.isUseBlog
          ? Selector<BlogModel, List<Category>>(
              builder: (context, categories, child) => getTreeView(
                categories: categories,
              ),
              selector: (_, model) => model.categories,
            )
          : Selector<CategoryModel, List<Category>>(
              builder: (context, categories, child) => getTreeView(
                categories: categories,
              ),
              selector: (_, model) => model.categories ?? [],
            ),
    );

    if (widget.useExpansionStyle) {
      return ExpansionWidget(
        showDivider: true,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 5,
        ),
        title: Text(
          S.of(context).byCategory,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        children: [menuCategory],
      );
    }

    return menuCategory;
  }
}
