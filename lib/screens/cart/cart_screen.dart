import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../common/constants.dart';
import '../../generated/l10n.dart';
import '../../models/cart/cart_base.dart';
import '../../widgets/common/loading_body.dart';
import '../common/app_bar_mixin.dart';
import 'my_cart_screen.dart';

class CartScreenArgument {
  final bool isModal;
  final bool isBuyNow;
  final bool hideNewAppBar;

  CartScreenArgument({
    required this.isModal,
    required this.isBuyNow,
    this.hideNewAppBar = false,
  });
}

class CartScreen extends StatefulWidget {
  final bool? isModal;
  final bool isBuyNow;
  final bool hideNewAppBar;
  final bool enabledTextBoxQuantity;

  const CartScreen({
    this.isModal,
    this.isBuyNow = false,
    this.hideNewAppBar = false,
    this.enabledTextBoxQuantity = true,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AppBarMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    screenScrollController = _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: renderScaffold(

        routeName: RouteList.cart,
        hideNewAppBar: widget.hideNewAppBar,
        secondAppBar: AppBar(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.07,
          title: Text(S.of(context).myCart,style: const TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        child: Selector<CartModel, bool>(
          selector: (_, cartModel) => cartModel.calculatingDiscount,
          builder: (context, calculatingDiscount, child) {
            return LoadingBody(
              isLoading: calculatingDiscount,
              child: child!,
            );
          },
          child: MyCart(
            isBuyNow: widget.isBuyNow,
            enabledTextBoxQuantity: widget.enabledTextBoxQuantity,
            isModal: widget.isModal,
            scrollController: _scrollController,
            hasNewAppBar: showAppBar(RouteList.cart),
          ),
        ),
      ),
    );
  }
}
