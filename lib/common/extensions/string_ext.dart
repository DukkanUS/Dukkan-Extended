import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../config.dart';
import '../constants.dart';
import '../enums/replaced_params.dart';

extension StringExtension on String {
  String? getPrivacyPolicies({bool isGetPageId = false}) {
    final value = this;

    if ((isGetPageId && int.tryParse(value) != null) ||
        value.startsWith('https://') ||
        value.startsWith('http://')) {
      return value.toString();
    }

    return null;
  }

  String addUrlQuery(String query) {
    if (query.isEmpty) {
      return this;
    }

    return contains('?') ? '$this&$query' : '$this?$query';
  }

  String addWooCookieToUrl(String? cookie) {
    if (cookie?.isNotEmpty ?? false) {
      final base64Str = EncodeUtils.encodeCookie(cookie!);
      return addUrlQuery('cookie=$base64Str');
    }

    return this;
  }

  String addWebProxy() {
    if (kIsWeb) {
      return '${Configurations.webProxy}$this';
    }

    return this;
  }

  String replaceHtmlTag() {
    return replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('<a>', '')
        .replaceAll('</a>', '');
  }
}

extension NullStringExtension on String? {
  String getReplacedParams(BuildContext context) {
    if (this == null) return '';

    var newText = '$this';

    for (var element in ReplacedParams.values) {
      switch (element) {
        case ReplacedParams.userName:
          final userName =
              context.select((UserModel? _) => _?.user?.name) ?? '';
          newText = newText.replaceAll(element.param, userName);
          break;
        default:
      }
    }

    return newText;
  }
}
