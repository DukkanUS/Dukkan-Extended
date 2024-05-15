import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../quantity_selection_state_ui.dart';

class QuantitySelectionStyle02 extends StatelessWidget {
  const QuantitySelectionStyle02(
    this.stateUI, {
    super.key,
    this.onShowOption,
  });

  final QuantitySelectionStateUI stateUI;
  final void Function()? onShowOption;

  @override
  Widget build(BuildContext context) {
    final iconPadding = EdgeInsets.all(
      max(
        ((stateUI.height) - 24.0 - 8) * 0.5,
        0.0,
      ),
    );

    final enableTextBox = stateUI.enabled == true && stateUI.enabledTextBox;

    final textField = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: enableTextBox ? null : onShowOption,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.only(bottom: 2),
        // height: stateUI.height, // Caculated height by [contentPadding.top] +
        // [contentPadding.bottom] + [textFontSize]
        width: stateUI.expanded == true ? null : stateUI.width,
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1.0, color: kGrey200),
        //   borderRadius: BorderRadius.circular(6),
        // ),
        alignment: Alignment.center,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          focusNode: stateUI.focusNode,
          readOnly: stateUI.enabled == false || stateUI.enabledTextBox == false,
          enabled: enableTextBox,
          controller: stateUI.textController,
          maxLines: 1,
          maxLength: '${stateUI.limitSelectQuantity}'.length,
          onChanged: (_) => stateUI.onQuantityChanged(),
          onSubmitted: (_) => stateUI.onQuantityChanged(),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.all(stateUI.height / 2 -
                12), // 12 is magic number 🤣 (fontSize I think so)
            isDense: true, // Required for text centering
          ),
          style: Theme.of(context).textTheme.bodySmall,
          keyboardType: const TextInputType.numberWithOptions(
            signed: true,
            decimal: false,
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Row(
      children: [
        stateUI.enabled == true
            ? Container(
                height: stateUI.height,
                width: stateUI.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(stateUI.height),
                ),
                child: IconButton(
                  padding: iconPadding,
                  onPressed: () {
                    if (stateUI.focusNode?.hasFocus ?? false) {
                      stateUI.focusNode?.unfocus();
                    }
                    stateUI.changeQuantity(stateUI.currentQuantity - 1);
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: stateUI.expanded == true
              ? Expanded(
                  child: textField,
                )
              : textField,
        ),
        stateUI.enabled == true
            ? Container(
                height: stateUI.height,
                width: stateUI.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(stateUI.height),
                ),
                child: IconButton(
                  padding: iconPadding,
                  onPressed: () {
                    if (stateUI.focusNode?.hasFocus ?? false) {
                      stateUI.focusNode?.unfocus();
                    }
                    stateUI.changeQuantity(stateUI.currentQuantity + 1);
                  },
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
