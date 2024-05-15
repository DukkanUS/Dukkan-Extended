import 'package:flutter/material.dart';
import 'package:inspireui/widgets/expandable/expansion_widget.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/index.dart' show BlogModel, ProductModel, Tag, TagModel;
import '../../../services/services.dart';
import 'filter_option_item.dart';

class BackDropTagMenu extends StatefulWidget {
  const BackDropTagMenu({
    super.key,
    this.onChanged,
    this.isUseBlog = false,
    this.isBlog = false,
    this.tagId,
    this.allowMultiple = false,
    this.useExpansionStyle = true,
  });

  final Function(List<String> tagId)? onChanged;
  final bool isUseBlog;
  final bool isBlog;
  final List<String>? tagId;
  final bool allowMultiple;
  final bool useExpansionStyle;

  @override
  State<BackDropTagMenu> createState() => _BackDropTagMenuState();
}

class _BackDropTagMenuState extends State<BackDropTagMenu> {
  ProductModel get productModel => context.read<ProductModel>();
  BlogModel get blogModel => context.read<BlogModel>();

  List<String>? get tagId =>
      widget.isUseBlog ? blogModel.tagIds : productModel.tagIds;

  List<String> _tagId = [];

  @override
  void initState() {
    _tagId = widget.tagId ?? tagId ?? [];
    super.initState();
  }

  void _onTapTag(String? id) {
    setState(() {
      if (_tagId.contains(id)) {
        _tagId.remove(id);
      } else {
        if (widget.allowMultiple) {
          _tagId.add(id!);
        } else {
          _tagId = [id!];
        }
      }
    });
    widget.onChanged?.call(_tagId);
  }

  Widget renderTagList(
    List<Tag> tagList, {
    Widget loadmore = const SizedBox(),
  }) {
    final listTag = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: 100,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.4,
            children: List.generate(
              tagList.length,
              (index) {
                final tagItem = tagList[index];
                final selected = _tagId.contains(tagItem.id);
                return FilterOptionItem(
                  enabled: true,
                  selected: selected,
                  title: tagList[index].name!.toUpperCase(),
                  isBlog: widget.isBlog,
                  onTap: () => _onTapTag(tagItem.id),
                );
              },
            )..add(loadmore),
          ),
        ),
      ],
    );
    if (widget.useExpansionStyle) {
      return ExpansionWidget(
        showDivider: true,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 10,
        ),
        title: Text(
          S.of(context).byTag,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        children: [listTag],
      );
    }

    return listTag;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isUseBlog) {
      return Selector<BlogModel, List<Tag>>(
        selector: (_, model) => model.tags,
        builder: (context, tagList, child) {
          if (tagList.isEmpty) {
            return const SizedBox();
          }
          return renderTagList(tagList);
        },
      );
    }
    return Consumer<TagModel>(
      builder: (_, TagModel tagModel, __) {
        var tagList = tagModel.tagList ?? <Tag>[];

        if (tagList.isEmpty) {
          return const SizedBox();
        }
        var loadmore = Builder(builder: (context) {
          if (!tagModel.hasNext) {
            return const SizedBox();
          }
          if (tagModel.isLoadMore) {
            return SizedBox(
              width: 70,
              height: 50,
              child: Center(
                child: JumpingDots(
                  innerPadding: 2,
                  radius: 6,
                  color: Services().widget.enableProductBackdrop
                      ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          }

          return FilterOptionItem(
            title: S.of(context).more,
            selected: false,
            onTap: tagModel.getData,
          );
        });
        return renderTagList(tagList, loadmore: loadmore);
      },
    );
  }
}
