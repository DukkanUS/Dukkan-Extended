import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../common/config.dart';
import '../../../../common/constants.dart';
import '../../../../common/tools.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/index.dart';
import '../../../../modules/re_order/reoder_mixin.dart';
import '../../index.dart';

class CustomOrderListItem extends StatelessWidget with ReOderMixin {
  final bool isModal;

  const CustomOrderListItem({super.key, this.isModal = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Consumer<OrderHistoryDetailModel>(builder: (_, model, __) {
        final order = model.order;
        final currencyCode =
            order.currencyCode ?? Provider.of<AppModel>(context).currencyCode;

        return Container(
          width: size.width,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6,
              )
            ],
          ),
          margin: const EdgeInsets.only(
            top: 15.0,
            left: 15.0,
            right: 15.0,
            bottom: 10.0,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10.0, right: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14.0),
                      topRight: Radius.circular(14.0),
                    ),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (order.lineItems.isNotEmpty)
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .6,
                                        child: Text(
                                          Bidi.stripHtmlIfNeeded(
                                            order.lineItems[0].name.toString(),
                                          ),
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text('\$ ${order.total.toString()}')
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                      '${order.totalQuantity.toString()} items'),

                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: order.lineItems
                              .map(
                                (element) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  // Adjust spacing between items if needed
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    width: 80,
                                    height: 75,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: ImageResize(
                                        url: element.featuredImage ??
                                            kDefaultImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(thickness: .3, height: .3),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(14.0),
                      bottomRight: Radius.circular(14.0),
                    ),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor)))),
                              onPressed: () {
                                reOrder(context, order);
                              },
                              child: const Text('Add to cart'))),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isModal) {
                                showDialog(
                                  context: context,
                                  builder: (context) => ChangeNotifierProvider<
                                      OrderHistoryDetailModel>.value(
                                    value: model,
                                    child: GestureDetector(
                                      onTap: Navigator.of(context).pop,
                                      child: Material(
                                        color: Colors.black26,
                                        child: Center(
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.8,
                                            width: 500,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child:
                                                  const OrderHistoryDetailScreen(
                                                enableReorder: true,
                                                disableReview: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.of(context).pushNamed(
                                  RouteList.orderDetail,
                                  arguments: OrderDetailArguments(
                                    model: model,
                                    disableReview: !kAdvanceConfig.enableRating,
                                  ),
                                );
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor)))),
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final String? title;
  final String? detail;

  const OrderStatusWidget({super.key, this.title, this.detail});

  String getTitleStatus(String status, BuildContext context) {
    switch (status.toLowerCase()) {
      case 'onhold':
        return S.of(context).orderStatusOnHold;
      case 'pending':
        return S.of(context).orderStatusPendingPayment;
      case 'failed':
        return S.of(context).orderStatusFailed;
      case 'processing':
        return S.of(context).orderStatusProcessing;
      case 'completed':
        return S.of(context).orderStatusCompleted;
      case 'cancelled':
        return S.of(context).orderStatusCancelled;
      case 'refunded':
        return S.of(context).orderStatusRefunded;
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusOrderColor;
    switch (detail!.toLowerCase()) {
      case 'pending':
        {
          statusOrderColor = Colors.red;
          break;
        }
      case 'processing':
        {
          statusOrderColor = Colors.orange;
          break;
        }
      case 'completed':
        {
          statusOrderColor = Colors.green;
          break;
        }
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Text(
              title.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                    fontSize: 14.0,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  )
                  .apply(fontSizeFactor: 0.9),
            ),
          ),
          Expanded(
            child: Text(
              getTitleStatus(detail!, context).capitalize(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: statusOrderColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOrderStatusWidget extends StatelessWidget {
  final String? title;
  final String? detail;

  const CustomOrderStatusWidget({super.key, this.title, this.detail});

  String getTitleStatus(String status, BuildContext context) {
    switch (status.toLowerCase()) {
      case 'onhold':
        return S.of(context).orderStatusOnHold;
      case 'pending':
        return S.of(context).orderStatusPendingPayment;
      case 'failed':
        return S.of(context).orderStatusFailed;
      case 'processing':
        return S.of(context).orderStatusProcessing;
      case 'completed':
        return S.of(context).orderStatusCompleted;
      case 'cancelled':
        return S.of(context).orderStatusCancelled;
      case 'refunded':
        return S.of(context).orderStatusRefunded;
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusOrderColor;
    switch (detail!.toLowerCase()) {
      case 'pending':
        {
          statusOrderColor = Colors.red;
          break;
        }
      case 'processing':
        {
          statusOrderColor = Colors.orange;
          break;
        }
      case 'completed':
        {
          statusOrderColor = Theme.of(context).primaryColor;
          break;
        }
    }

    return Container(
      width: 80,
      height: 28,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side:  BorderSide(width: 1, color: statusOrderColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          getTitleStatus(detail!, context).capitalize(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: statusOrderColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
