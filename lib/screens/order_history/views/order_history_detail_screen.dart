import 'dart:async';
import 'dart:developer';

import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fstore/screens/order_history/views/widgets/custom_order_list_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools.dart';
import '../../../custom/providers/return_request_provider.dart';
import '../../../generated/l10n.dart';
import '../../../models/entities/aftership.dart';
import '../../../models/index.dart' show AppModel, OrderStatus, OrderStatusExtension;

// import '../../../models/order/order.dart';
import '../../../services/index.dart';
import '../../../widgets/common/box_comment.dart';
import '../../../widgets/common/webview.dart';
import '../../../widgets/html/index.dart';
import '../../base_screen.dart';
import '../../checkout/widgets/success.dart';
import '../models/order_history_detail_model.dart';
import 'widgets/order_price.dart';
import 'widgets/product_order.dart';

class OrderDetailArguments {
  OrderHistoryDetailModel model;
  bool enableReorder;
  bool disableReview;

  OrderDetailArguments({
    required this.model,
    this.enableReorder = true,
    this.disableReview = false,
  });
}

class OrderHistoryDetailScreen extends StatefulWidget {
  final bool enableReorder;
  final bool disableReview;

  const OrderHistoryDetailScreen({
    this.enableReorder = true,
    this.disableReview = false,
  });

  @override
  BaseScreen<OrderHistoryDetailScreen> createState() =>
      _OrderHistoryDetailScreenState();
}

class _OrderHistoryDetailScreenState
    extends BaseScreen<OrderHistoryDetailScreen> {
  OrderHistoryDetailModel get orderHistoryModel =>
      Provider.of<OrderHistoryDetailModel>(context, listen: false);

  @override
  void afterFirstLayout(BuildContext context) {
    super.afterFirstLayout(context);
    // orderHistoryModel.getTracking();
    orderHistoryModel.getOrderNote();
  }

  void cancelOrder() {
    orderHistoryModel.cancelOrder();
  }

  void _onNavigate(context, AfterShipTracking afterShipTracking) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebView(
          url:
              "${afterShip['tracking_url']}/${afterShipTracking.slug}/${afterShipTracking.trackingNumber}",
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(S.of(context).trackingPage),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      if(orderHistoryModel.order.id?.isNotEmpty ?? false) {
         await context.read<ReturnRequestProvider>().getReturnRequest(int.parse(orderHistoryModel.order.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Consumer<OrderHistoryDetailModel>(builder: (context, model, child) {
      final order = model.order;
      final currencyCode =
          order.currencyCode ?? Provider.of<AppModel>(context).currencyCode!;
      final currencyRate = (order.currencyCode?.isEmpty ?? true)
          ? Provider.of<AppModel>(context).currencyRate
          : null;
      // final loggedIn = Provider.of<UserModel>(context).loggedIn;

      final isPending = (order.status != OrderStatus.refunded &&
          order.status != OrderStatus.canceled &&
          order.status != OrderStatus.completed);

      final allowCancelAndRefund =
          kPaymentConfig.paymentListAllowsCancelAndRefund.isEmpty ||
              kPaymentConfig.paymentListAllowsCancelAndRefund
                  .contains(order.paymentMethod);

      // final isCompositeCart = order.lineItems.firstWhereOrNull(
      //         (e) => e.product?.isCompositeProduct ?? false) !=
      //     null;
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.07,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          centerTitle: true,
          title: Text(
            '${S.of(context).orderNo} #${order.number}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          // actions: [
          //   Center(child: Services().widget.reOrderButton(order)),
          // ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// order notes

              const SizedBox(height: 15,),
              Container(
                height: 100,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const SizedBox(width: 20,),
                       Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(model.listOrderNote?.first.note ?? ''),
                              Text('#${order.number ?? ''}',style: const TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          )),
                      const SizedBox(width: 20,),
                      Expanded(
                          flex: 1,
                          child: CustomOrderStatusWidget(
                            title: S.of(context).status,
                            detail: order.status == OrderStatus.unknown &&
                                order.orderStatus != null
                                ? order.orderStatus
                                : order.status!.content,
                          ),),
                      const SizedBox(width: 20,),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),

              const Text('Order Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

              /// items and rate and return
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 8),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.lineItems.length,
                itemBuilder: (context, index) {
                  final item = order.lineItems[index];
                  return ProductOrder(
                    orderId: order.id!,
                    orderStatus: order.status!,
                    product: item,
                    index: index,
                    storeDeliveryDates: order.storeDeliveryDates,
                    currencyCode: order.currencyCode,
                    disableReview: widget.disableReview,
                  );
                },
              ),
              /// payment information
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: <Widget>[
                    if (order.deliveryDate != null &&
                        order.storeDeliveryDates == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(S.of(context).expectedDeliveryDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                    )),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                order.deliveryDate!,
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    if (order.paymentMethodTitle?.isNotEmpty ?? false)
                      _CustomListTile(
                        leading: S.of(context).paymentMethod,
                        trailing: order.paymentMethodTitle!,
                      ),
                    // if (order.paymentMethodTitle?.isNotEmpty ?? false)
                    //   const SizedBox(height: 10),
                    // (order.shippingMethodTitle?.isNotEmpty ?? false) &&
                    //         kPaymentConfig.enableShipping
                    //     ? _CustomListTile(
                    //         leading: S.of(context).shippingMethod,
                    //         trailing: order.shippingMethodTitle!,
                    //       )
                    //     : const SizedBox(),
                    if (order.totalShipping != null) const SizedBox(height: 10),
                    if (order.totalShipping != null)
                      _CustomListTile(
                        leading: 'Delivery Fee',
                        trailing: PriceTools.getCurrencyFormatted(
                            order.totalShipping, currencyRate,
                            currency: currencyCode)!,
                      ),
                    const SizedBox(height: 10),
                    ...List.generate(
                      order.feeLines.length,
                      (index) {
                        final item = order.feeLines[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(item.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                      )),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  PriceTools.getCurrencyFormatted(
                                      item.total, currencyRate,
                                      currency: currencyCode)!,
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    _CustomListTile(
                      leading: S.of(context).subtotal,
                      trailing: PriceTools.getCurrencyFormatted(
                          order.lineItems.fold(
                              0,
                                  (dynamic sum, e) =>
                              sum + double.parse(e.total!)),
                          currencyRate,
                          currency: currencyCode)!,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          S.of(context).totalTax,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        OrderPrice.tax(
                          order: order,
                          currencyRate: currencyRate,
                          currencyCode: currencyCode,
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          S.of(context).total,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        OrderPrice(
                          order: order,
                          currencyRate: currencyRate,
                          currencyCode: currencyCode,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// nothing
              if (model.order.aftershipTrackings.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(S.of(context).orderTracking,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Column(
                      children: List.generate(
                        model.order.aftershipTrackings.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetector(
                            onTap: () => _onNavigate(
                                context, model.order.aftershipTrackings[index]),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                      '${index + 1}. ${S.of(context).trackingNumberIs} '),
                                  Text(
                                    model.order.aftershipTrackings[index]
                                        .trackingNumber!,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // /// status tracking
              // Services().widget.renderOrderTimelineTracking(context, order),
              // const SizedBox(height: 20),

              /// Render the Cancel
              if (kPaymentConfig.enableRefundCancel && allowCancelAndRefund)
                Services()
                    .widget
                    .renderButtons(context, order, cancelOrder, refundOrder),

              const SizedBox(height: 20),

              /// refund request
              if (order.status == OrderStatus.processing &&
                  kPaymentConfig.enableRefundCancel)
                Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonTheme(
                            height: 45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: HexColor('#056C99'),
                                ),
                                onPressed: refundOrder,
                                child: Text(
                                    S.of(context).refundRequest.toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),

              if (isPending && kPaymentConfig.showTransactionDetails) ...[
                if (order.bacsInfo.isNotEmpty && order.paymentMethod == 'bacs')
                  Text(
                    S.of(context).ourBankDetails,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ...order.bacsInfo.map((e) => BankAccountInfo(bankInfo: e)),
                const SizedBox(height: 15),

                /// Thai PromptPay
                /// false: hide show Thank you message - https://tppr.me/xrNh1
                Services()
                    .thaiPromptPayBuilder(showThankMsg: false, order: order),
                const SizedBox(height: 15),
              ],

              /// shipping address
              if (order.billing != null) ...[
                const Text('Delivery Address',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(order.billing!.fullInfoAddress),
              ],
              const SizedBox(height: 50)
            ],
          ),
        ),
      );
    });
  }

  String getCountryName(country) {
    try {
      return CountryPickerUtils.getCountryByIsoCode(country).name;
    } catch (err) {
      return country;
    }
  }

  Future<void> refundOrder() async {
    var loadingContext = context;
    _showLoading((BuildContext context) {
      loadingContext = context;
    });
    try {
      await orderHistoryModel.createRefund();
      _hideLoading(loadingContext);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).refundOrderSuccess)));
    } catch (err) {
      _hideLoading(loadingContext);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).refundOrderFailed)));
    }
  }

  void _showLoading(Function(BuildContext) onGetContext) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        onGetContext(context);
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kLoadingWidget(context),
              ],
            ),
          ),
        );
      },
    );
  }

  void _hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  String formatTime(DateTime time) {
    return DateFormat('dd/MM/yyyy, HH:mm').format(time);
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: Text(leading),
          ),
          Flexible(
            child: Text(trailing),
          )
        ],
      ),
    );
  }
}
