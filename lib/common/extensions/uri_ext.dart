import 'package:flutter/foundation.dart';

import '../config.dart';

extension UriExt on Uri {
  Uri addProxy([String? webProxy]) {
    var uri = this;
    if (kIsWeb && '$uri'.contains(Configurations.webProxy) == false) {
      final proxyURL = '${Configurations.webProxy}$uri';
      uri = Uri.parse(proxyURL);
    }

    return uri;
  }
}
