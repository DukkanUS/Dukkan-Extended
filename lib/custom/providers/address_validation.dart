import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../common/constants.dart';
import '../../models/user_model.dart';

class AddressValidation with ChangeNotifier {
  bool isValid = true;

  void setValid() {
    isValid = true;
    notifyListeners();
    try{
      unawaited(App.fluxStoreNavigatorKey.currentState!.context.read<UserModel>().saveAddressValidationStatus(status: isValid));
    }catch(e){
      printLog(e.toString());
    }
  }

  void setInvalid() {
    isValid = false;
    notifyListeners();
    try{
    unawaited(App.fluxStoreNavigatorKey.currentState!.context.read<UserModel>().saveAddressValidationStatus(status: isValid));
    }catch(e){
      printLog(e.toString());
    }


  }
}
