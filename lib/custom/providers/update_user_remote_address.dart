import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../models/index.dart';
import '../../services/services.dart';

class UpdateUserRemoteAddress with ChangeNotifier {
  final _service = Services();
  final _user =
      Provider.of<UserModel>(App.fluxStoreNavigatorKey.currentState!.context,listen: false)
          .user;

  Future<void> updateProfileAddress() async {
    try {
      var cartModel = Provider.of<CartModel>(
          App.fluxStoreNavigatorKey.currentState!.context,
          listen: false);
      var data = {
        'shipping_address_1': cartModel.address?.street ?? '',
        'shipping_address_2': cartModel.address?.apartment ?? '',
        'shipping_city': cartModel.address?.city ?? '',
        'shipping_country': cartModel.address?.country ?? '',
        'shipping_state': cartModel.address?.state ?? '',
        'shipping_postcode': cartModel.address?.zipCode ?? '',
      };

      await _service.api.updateUserInfo(data, _user!.cookie);
    } catch (e) {
      rethrow;
    }
  }
}
