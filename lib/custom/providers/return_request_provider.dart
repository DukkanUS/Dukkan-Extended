import 'package:flutter/material.dart';

import '../custom_entities/returns_model.dart';
import '../custom_services/custom_services.dart';

class ReturnRequestProvider with ChangeNotifier {
  Returns? returnsList;

  bool isLoading = false;

  Future<bool> sendReturnRequest(
      {required ReturnsRequest request, required int id}) async {
    var requestStatus = await CustomServices.sendReturnRequest(request);
    if (requestStatus) {
      await getReturnRequest(id);
    }
    notifyListeners();
    return requestStatus;
  }

  Future<void> getReturnRequest(int id) async {
    returnsList = await CustomServices.getReturnRequest(id);
    notifyListeners();
  }
}
