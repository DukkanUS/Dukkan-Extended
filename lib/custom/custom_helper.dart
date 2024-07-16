import 'package:flutter/cupertino.dart';

import '../models/entities/country.dart';
import 'custom_services/custom_services.dart';

class SupportedCountryModel {
  String? nameAr;
  String? iso2Code;

  SupportedCountryModel({required this.nameAr, required this.iso2Code});
}

class CustomHelper with ChangeNotifier{
  static List<SupportedCountryModel> supportedCountries = [
    SupportedCountryModel(iso2Code: 'JO', nameAr: 'الأردن')
  ];

  Future<Map<String, dynamic>> getVariantColorsList() async{
    return CustomServices.getVariantColorsList();
  }
}
