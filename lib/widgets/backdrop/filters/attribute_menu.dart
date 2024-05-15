import 'package:flutter/material.dart';
import 'package:inspireui/widgets/expandable/expansion_widget.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/index.dart';
import '../../../services/services.dart';
import 'filter_option_item.dart';

class AttributeMenu extends StatefulWidget {
  const AttributeMenu({
    super.key,
    this.onChanged,
    this.useExpansionStyle = true,
  });

  final VoidCallback? onChanged;
  final bool useExpansionStyle;

  @override
  State<AttributeMenu> createState() => AttributeMenuState();
}

class AttributeMenuState extends State<AttributeMenu> {
  FilterAttribute? currentAttributeId;

  FilterAttributeModel get filterAttributeModel =>
      context.read<FilterAttributeModel>();

  void _onTapAttribute(int? id) {
    if (filterAttributeModel.isLoading) {
      return;
    }

    filterAttributeModel.getAttr(id: id!);
  }

  void _onTapSubAttribute(int index, bool value) {
    filterAttributeModel.updateAttributeSelectedItem(index, value);
    widget.onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterAttributeModel>(
      builder: (_, value, child) {
        if (value.lstProductAttribute?.isNotEmpty ?? false) {
          var list = List<Widget>.generate(
            value.lstProductAttribute!.length,
            (index) {
              final item = value.lstProductAttribute![index];
              return FilterOptionItem(
                enabled: !value.isLoading,
                onTap: () {
                  _onTapAttribute(item.id);
                },
                title: item.name!.toUpperCase(),
                isValid: value.indexSelectedAttr != -1,
                selected: value.indexSelectedAttr == index,
              );
            },
          );

          final attrWidget = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: list.length > 4 ? 100 : 50,
                margin: const EdgeInsets.only(left: 10.0),
                constraints: const BoxConstraints(maxHeight: 100),
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 0.4,
                  shrinkWrap: true,
                  crossAxisCount: list.length > 4 ? 2 : 1,
                  children: list,
                ),
              ),
              _renderSubAttributeList(context, value),
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
                S.of(context).attributes,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              children: [attrWidget],
            );
          }

          return attrWidget;
        }
        return const SizedBox();
      },
    );
  }

  Widget _renderSubAttributeList(
      BuildContext context, FilterAttributeModel model) {
    if (model.isLoading && model.indexSelectedAttr == -1) {
      return loadingMoreWidget();
    }

    if (model.indexSelectedAttr == -1 || model.lstCurrentAttr.isEmpty) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Wrap(
        runSpacing: 8,
        children: [
          ...List.generate(
            model.lstCurrentAttr.length,
            (index) {
              return _SubAttributeItem(
                name: model.lstCurrentAttr[index].name!,
                isSelected: model.lstCurrentSelectedTerms[index],
                onSelected: (val) {
                  _onTapSubAttribute(index, val);
                },
              );
            },
          ),
          if (model.isLoadingMore) loadingMoreWidget(),
          if (!model.isLoadingMore && !model.isEnd)
            _SubAttributeItem(
              name: S.of(context).more,
              isSelected: false,
              onSelected: (val) {
                final selectedAttrId =
                    model.lstProductAttribute![model.indexSelectedAttr].id;
                model.getAttr(id: selectedAttrId);
              },
            ),
        ],
      ),
    );
  }

  Widget loadingMoreWidget() {
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
}

class _SubAttributeItem extends StatelessWidget {
  const _SubAttributeItem({
    required this.name,
    required this.isSelected,
    required this.onSelected,
  });

  final String name;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    var primaryBackground = Services().widget.enableProductBackdrop
        ? Colors.white
        : Theme.of(context).primaryColor.withOpacity(0.2);
    var primaryText = Theme.of(context).primaryColor;
    var primaryColorLight = Theme.of(context).primaryColorLight;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: FilterChip(
        selectedColor: primaryBackground,
        backgroundColor: primaryColorLight,
        label: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isSelected ? primaryText : null,
                letterSpacing: 1.2,
              ),
        ),
        checkmarkColor: primaryText,
        selected: isSelected,
        onSelected: onSelected,
      ),
    );
  }
}
