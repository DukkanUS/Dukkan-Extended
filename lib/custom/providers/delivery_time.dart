
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../frameworks/woocommerce/services/woo_commerce.dart';

class DeliveryTime with ChangeNotifier{
  bool isFetchWorkingHours = false;
  List<String?> workingHours = [];

  var deliveryTime = 'Any';

  void updateDeliveryTime({required String period}){

    deliveryTime = period;

  }

  Future<void> fetchDeliveryHours() async {
    try {
      isFetchWorkingHours = true;
      notifyListeners();
      var remoteWorkingHours = await WooCommerceService.fetchDeliveryHours();
      workingHours = remoteWorkingHours;
      isFetchWorkingHours = false;
      notifyListeners();
    } on Exception catch (e) {
      log(e.toString());
      isFetchWorkingHours = false;
      notifyListeners();
    }
  }


}