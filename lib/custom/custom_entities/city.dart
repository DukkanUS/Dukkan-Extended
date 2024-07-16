class City
{
  String? nameEn;
  String? nameAr;
  String? value;

  City({required this.nameAr,required this.nameEn,required this.value});
  City.fromConfig(dynamic parsedJson) {
    if (parsedJson is Map) {
      nameEn = parsedJson['nameEn'];
      nameAr = parsedJson['nameAr'];
      value = parsedJson['value'];
    }
    if (parsedJson is String) {
      nameEn = parsedJson;
      nameAr = parsedJson;
      value = parsedJson;
    }
  }

}
