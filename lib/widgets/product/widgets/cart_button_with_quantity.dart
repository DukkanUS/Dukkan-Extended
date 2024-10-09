import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CartButtonWithQuantity extends StatefulWidget {
  const CartButtonWithQuantity({
    super.key,
    required this.quantity,
    this.borderRadiusValue = 0,
    required this.increaseQuantityFunction,
    required this.decreaseQuantityFunction,
  });

  final int quantity;
  final double borderRadiusValue;
  final VoidCallback increaseQuantityFunction;
  final VoidCallback decreaseQuantityFunction;

  @override
  State<CartButtonWithQuantity> createState() => _CartButtonWithQuantityState();
}

class _CartButtonWithQuantityState extends State<CartButtonWithQuantity> {
  var _isShowQuantity = false;

  int get _quantity => widget.quantity;

  final _focusNode = FocusNode();

  @override
  void didUpdateWidget(covariant CartButtonWithQuantity oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_quantity == 0) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }


  Timer? _closeTimer;

  void startCloseTimer() {
    _closeTimer?.cancel();
    _closeTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _focusNode.unfocus();
      }
    });
  }

  void resetCloseTimer() {
    _closeTimer?.cancel();
    startCloseTimer();
  }



  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          if (!_isShowQuantity) {
            showQuantity();
          }
        } else {
          if (_isShowQuantity) {
            hideQuantity();
          }
        }
      },
      child: Builder(
        builder: (BuildContext context) {
          final hasFocus = _focusNode.hasFocus;
          return GestureDetector(
              onTap: () {
                if (hasFocus) {
                  _focusNode.unfocus();
                } else {
                  _focusNode.requestFocus();
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: _isShowQuantity
                    ? buildSelector()
                    : _quantity == 0
                        ? buildAddButton()
                        : buildQuantity(),
              ));
        },
      ),
    );
  }

  Widget buildSelector() {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, right: 6),
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xff1ED760),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: decreaseQuantity,
            icon: (_quantity == 1) ? const Icon(
              CupertinoIcons.delete,
              size: 20,
              color: Colors.white,
            ) : const Icon(
              Icons.remove,
              size: 20,
              color: Colors.white,
            ),
          ),
          Text('$_quantity',style: const TextStyle(color: Colors.white),),
          IconButton(
            onPressed: increaseQuantity,
            icon: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        _focusNode.requestFocus();
        increaseQuantity();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff1ED760),
        shape: const CircleBorder(),
        minimumSize: const Size.square(40),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        Icons.add,
        size: 20,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }

  Widget buildQuantity() {
    return OutlinedButton(
      onPressed: () {
        _focusNode.requestFocus();
        startCloseTimer();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.background,
        side: const BorderSide(color: Color(0xff1ED760)),
        minimumSize: const Size.square(40),
      ),
      child: Text(
        '$_quantity',
        style: const TextStyle(
          color: Color(0xff1ED760),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void increaseQuantity() {
    resetCloseTimer();
    widget.increaseQuantityFunction();
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) {
        if (_quantity == 0) {
          hideQuantity();
        }
      }
    });
  }

  void decreaseQuantity() {
    resetCloseTimer();
    widget.decreaseQuantityFunction();
  }

  void showQuantity() {
    setState(() {
      _isShowQuantity = true;
    });
  }

  void hideQuantity() {
    setState(() {
      _isShowQuantity = false;
    });
  }
}


class CustomCartButtonWithQuantity extends StatefulWidget {
  const CustomCartButtonWithQuantity({
    super.key,
    required this.quantity,
    this.borderRadiusValue = 0,
    required this.increaseQuantityFunction,
    required this.decreaseQuantityFunction,
  });

  final int quantity;
  final double borderRadiusValue;
  final VoidCallback increaseQuantityFunction;
  final VoidCallback decreaseQuantityFunction;

  @override
  State<CustomCartButtonWithQuantity> createState() => _CustomCartButtonWithQuantityState();
}

class _CustomCartButtonWithQuantityState extends State<CustomCartButtonWithQuantity> {

  int get _quantity => widget.quantity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: buildSelector(),
    );
  }

  Widget buildSelector() {
    return (_quantity == 0) ?
    GestureDetector(
      onTap: increaseQuantity,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6, right: 6),
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(S.of(context).addToCart,style: const TextStyle(color: Colors.white,fontSize: 16),),),
      ),
    )
        : Container(
      margin: const EdgeInsets.only(bottom: 6, right: 6),
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child:  IconButton(
              onPressed: decreaseQuantity,
              icon: (_quantity == 1)
                  ? Icon(
                CupertinoIcons.delete,
                size: 20,
                color: Theme.of(context).primaryColor,
              )
                  : Icon(
                Icons.remove,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Text(
            '$_quantity in cart',
            style: const TextStyle(color: Colors.white,fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: increaseQuantity,
              icon:  Icon(
                Icons.add,
                size: 20,
                color: Theme.of(context).primaryColor,  // Set icon color to contrast with white background
              ),
            ),
          ),

        ],
      ),
    );
  }

  void increaseQuantity() {
    widget.increaseQuantityFunction();
  }

  void decreaseQuantity() {
    widget.decreaseQuantityFunction();
  }
}
