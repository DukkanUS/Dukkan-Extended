import 'package:html_unescape/html_unescape.dart';

class FilterAttribute {
  int? id;
  String? slug;
  String? name;

  FilterAttribute.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    slug = parsedJson['slug'];
    final rawName = parsedJson['name']?.toString();
    name = rawName != null ? HtmlUnescape().convert(rawName).trim() : null;
  }
}

class SubAttribute {
  int? id;
  String? name;

  SubAttribute.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    final rawName = parsedJson['name']?.toString();
    name = rawName != null ? HtmlUnescape().convert(rawName).trim() : null;
  }

  @override
  String toString() {
    return '[id: $id ===== name: $name]';
  }
}
