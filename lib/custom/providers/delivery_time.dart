
import 'package:flutter/material.dart';

class DeliveryTime with ChangeNotifier{

  var deliveryTime = 'Any';

  void updateDeliveryTime({required String period}){

    deliveryTime = period;

  }


}