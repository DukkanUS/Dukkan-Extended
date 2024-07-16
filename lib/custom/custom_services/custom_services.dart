import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inspireui/utils/http_client.dart';
import 'package:inspireui/utils/logs.dart';
import '../../models/entities/coupon.dart';
import '../../services/services.dart';
import '../custom_constants.dart';
import '../custom_entities/force_update/app_configuration.dart';
class CustomServices {

  static const _timeout = Duration(seconds: 5);

  static Future<Coupons> getAutoApplyCoupons() async {
    try {
      var response =  await Services().api.getAutoApplyCoupons();
      return response!;

    } catch (e) {
      log('Exception occurred while getAutoApplyCoupons with $e');
      rethrow;
    }
  }

  static Future<AppConfiguration?> getLastStableVersion() async {
    try {
      final response = await http
          .get(Uri.parse(
              'https://evokey.tech/wp-json/evokey/v1/customers-versions?customer=${CustomConstants.appName}&platform=${Platform.isIOS ? 'ios' : 'android'}'))
          .timeout(_timeout);
      if (response.statusCode == 200) {
        return AppConfiguration.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      log('Exception occurred while getLastStableVersion');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getVariantColorsList() async {
    var url = 'https://mumuso.jo/wp-json/evokey/v1/colors';
    var response = await httpGet(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json',
    });
    var responseBody = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        log('*****************************');
        return responseBody;
      } else {
        log('error with color :: $responseBody');
      }
      return {};
    } catch (e) {
      log('error with color :: $e');
      rethrow;
    }
  }

}
