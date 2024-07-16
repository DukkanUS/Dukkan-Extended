import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';

import '../../models/cart/cart_base.dart';
import '../../models/entities/index.dart';

class CustomFirebaseAnalyticsServices {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  static Future logCustomEventCreated() async {
    unawaited(_analytics.logEvent(
      name: 'test_event',
      parameters: {'have_data': false},
    ));
  }

  static Future logBeginCheckoutEventCreated() async {
    unawaited(_analytics.logBeginCheckout());
  }

  static Future logAddToCartEventCreated(Product product) async {
    unawaited(_analytics.logAddToCart(items: [
      AnalyticsEventItem(
        itemId: product.id,
        itemName: product.name,
      )
    ]));
  }

  static Future logAddToWishlistEventCreated(Product product) async {
    unawaited(_analytics.logAddToWishlist(items: [
      AnalyticsEventItem(
        itemId: product.id,
        itemName: product.name,
      )
    ]));
  }

  static Future logPurchaseEventCreated(String transactionId) async {
    unawaited(_analytics.logPurchase(
      transactionId: transactionId,
    ));
  }
}
