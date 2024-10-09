import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools/flash.dart';
import '../../../common/tools/tools.dart';
import '../../../custom/product_quantity_button.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart' show CartModel, Product, ProductModel, UserModel;
import '../../../models/product_variant_model.dart';
import '../../../services/index.dart';
import '../../../widgets/product/action_button_mixin.dart';
import '../../../widgets/product/product_bottom_sheet.dart';
import '../../../widgets/product/widgets/cart_button_with_quantity.dart';
import '../../../widgets/product/widgets/heart_button.dart';
import '../../chat/vendor_chat.dart';
import '../widgets/buy_button_widget.dart';
import '../widgets/index.dart';
import '../widgets/product_common_info.dart';
import '../widgets/product_image_list.dart';
import '../widgets/product_image_slider.dart';

class SimpleLayout extends StatefulWidget {
  final Product product;
  final bool isProductInfoLoading;
  final ScrollController? scrollController;

  const SimpleLayout({
    required this.product,
    required this.isProductInfoLoading,
    this.scrollController,
  });

  @override
  // ignore: no_logic_in_create_state
  State<SimpleLayout> createState() => _SimpleLayoutState(product: product);
}

class _SimpleLayoutState extends State<SimpleLayout>
    with SingleTickerProviderStateMixin , ActionButtonMixin{
  late final _scrollController = widget.scrollController ?? ScrollController();
  final ValueNotifier<int> _selectIndexNotifier = ValueNotifier(0);

  late Product product;

  _SimpleLayoutState({required this.product});

  Map<String, String> mapAttribute = HashMap();
  late AnimationController _hideController;
  var top = 0.0;

  bool _isVisibleBuyButton = true;

  @override
  void initState() {
    super.initState();
    _hideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );
  }

  @override
  void didUpdateWidget(SimpleLayout oldWidget) {
    if (oldWidget.product.type != widget.product.type) {
      setState(() {
        product = widget.product;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _hideController.dispose();
    _selectIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    var hasProductInfo = true;
    final userModel = Provider.of<UserModel>(context, listen: false);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        bottom: false,
        top: kProductDetail.safeArea,
        child: ChangeNotifierProvider(
          create: (_) => ProductModel(),
          child: Consumer<ProductVariantModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Scaffold(
                          resizeToAvoidBottomInset: false,
                          floatingActionButton: (!ServerConfig()
                                      .isVendorType() ||
                                  !kConfigChat.enableVendorChat)
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: VendorChat(
                                    user: userModel.user,
                                    store: product.store,
                                  ),
                                ),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          body: CustomScrollView(
                            controller: _scrollController,
                            slivers: <Widget>[
                              SliverAppBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                elevation: 1.0,
                                expandedHeight:
                                    kIsWeb ? 0 : height * kProductDetail.height,
                                pinned: true,
                                floating: false,
                                leading: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        context
                                            .read<ProductModel>()
                                            .clearProductVariations();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  if (hasProductInfo)
                                    HeartButton(
                                      product: product,
                                      size: 20.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .primaryColorLight
                                          .withOpacity(0.7),
                                      child: IconButton(
                                          icon:
                                          const Icon(Icons.share, size: 19),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            var url = product.permalink;
                                            if (url?.isNotEmpty ?? false) {
                                              unawaited(
                                                FlashHelper.message(
                                                  context,
                                                  message: S
                                                      .of(context)
                                                      .generatingLink,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                ),
                                              );
                                              Services()
                                                  .firebase
                                                  .shareDynamicLinkProduct(
                                                itemUrl: url,
                                              );
                                            } else {
                                              unawaited(
                                                FlashHelper.errorMessage(
                                                  context,
                                                  message: S
                                                      .of(context)
                                                      .failedToGenerateLink,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ],
                                flexibleSpace: Builder(builder: (context) {
                                  var item = Product.cloneFrom(product);
                                  if (!kProductDetail.showVideo &&
                                      item.videoUrl != null) {
                                    item.videoUrl = null;
                                  }
                                  return kIsWeb
                                      ? const SizedBox()
                                      : kProductDetail.productImageLayout.isList
                                          ? ProductImageList(
                                              product: item,
                                              onChange: (index) {
                                                _selectIndexNotifier.value =
                                                    index;
                                              },
                                              height: height *
                                                  kProductDetail.height *
                                                  0.8,
                                            )
                                          : ProductImageSlider(
                                              product: item,
                                              onChange: (index) {
                                                _selectIndexNotifier.value =
                                                    index;
                                              },
                                            );
                                }),
                              ),
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  <Widget>[
                                    const SizedBox(height: 2),
                                    if (kIsWeb)
                                      ValueListenableBuilder<int>(
                                          valueListenable: _selectIndexNotifier,
                                          builder: (context, index, child) {
                                            return ProductGallery(
                                              product: widget.product,
                                              selectIndex: index,
                                            );
                                          }),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 4.0,
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: widget.product.isGroupedProduct
                                          ? const SizedBox()
                                          : ProductTitle(product),
                                    ),
                                  ],
                                ),
                              ),
                              if (Services().widget.enableShoppingCart(
                                  product.copyWith(isRestricted: false)))
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: ProductCommonInfo(
                                        product: widget.product,
                                        wrapSliver: false,
                                        isProductInfoLoading:
                                            widget.isProductInfoLoading,
                                      ),
                                    ),
                                  ),
                                ),
                              if (!Services().widget.enableShoppingCart(
                                      product.copyWith(isRestricted: false)) &&
                                  product.shortDescription != null &&
                                  product.shortDescription!.isNotEmpty)
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: ProductShortDescription(product),
                                  ),
                                ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    // horizontal: 15.0,
                                    vertical: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Services()
                                                .widget
                                                .renderVendorInfo(product),
                                            Services()
                                                .renderTiredPriceTable(product),
                                            Services()
                                                .renderCustomInformationTable(
                                                    product),
                                            ProductDescription(product),
                                            if (kProductDetail
                                                .showProductCategories)
                                              ProductDetailCategories(product),
                                            if (kProductDetail.showProductTags)
                                              ProductTag(product),
                                            if (widget.isProductInfoLoading ==
                                                false)
                                              Services()
                                                  .widget
                                                  .productReviewWidget(product),
                                          ],
                                        ),
                                      ),
                                      if (kProductDetail
                                              .showRelatedProductFromSameStore &&
                                          product.store?.id != null)
                                        RelatedProductFromSameStore(product),
                                      if (kProductDetail.showRelatedProduct &&
                                          widget.isProductInfoLoading == false)
                                        RelatedProduct(product),
                                      if (kProductDetail.showRecentProduct)
                                        RecentProducts(excludeProduct: product),
                                      const SizedBox(height: 50),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (Services().widget.enableShoppingCart(
                                product.copyWith(isRestricted: false)) &&
                            kAdvanceConfig.showBottomCornerCart)
                          Align(
                            alignment: Tools.isRTL(context)
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                            child: ExpandingBottomSheet(
                              hideController: _hideController,
                              onInitController: _onInitController,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Selector<CartModel, int>(
                    selector: (context, cartModel) =>
                    cartModel.productsInCart[product.id] ??
                        0,
                    builder: (context, quantity, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: CustomCartButtonWithQuantity(
                          quantity: quantity,
                          borderRadiusValue:0.0,
                          increaseQuantityFunction: () {
                            addToCart(
                              context,
                              quantity: 1,
                              product: product,
                              enableBottomAddToCart: false,
                            );
                          },
                          decreaseQuantityFunction: () {
                            if (quantity <= 0) return;
                            updateQuantity(
                              context: context,
                              quantity: quantity - 1,
                              product: product,
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // if (kProductDetail.fixedBuyButtonToBottom &&
                  //     _isVisibleBuyButton)
                  //   ProductQuantityButton(product:product),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onInitController(AnimationController controller) {
    controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _isVisibleBuyButton = false;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          _isVisibleBuyButton = true;
        });
      }
    });
  }
}
