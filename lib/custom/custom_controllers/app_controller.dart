
import 'package:package_info_plus/package_info_plus.dart';

import '../custom_constants.dart';
import '../custom_entities/force_update/app_configuration.dart';
import '../custom_entities/force_update/version.dart';
import '../custom_services/custom_services.dart';

class AppController {
  static const String appName = CustomConstants.appName;
  static const String iosAppID = CustomConstants.iosAppId;

  static bool isForceUpdate = false;
  static bool isUnderMaintenance = false;

  static PackageInfo? packageInfo;

  static void resetValues() {
    isForceUpdate = false;
    isUnderMaintenance = false;
  }

  static Future<AppConfiguration?> _getLastStableVersion() async {
    return await CustomServices.getLastStableVersion();
  }

  static Future<void> initialize() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();

      var appConfiguration = await _getLastStableVersion();

      isUnderMaintenance = !(appConfiguration!.active ?? true);

      var latestStableVersion = Version(
          buildNumber: int.parse(appConfiguration.buildNumber!),
          versionNumber: appConfiguration.versionNumber!);

      var forceUpdate = false;

      var currentVersion = Version(
          buildNumber: int.parse(packageInfo!.buildNumber),
          versionNumber: packageInfo!.version);

      if (latestStableVersion.versionNumber == currentVersion.versionNumber) {
        isForceUpdate =
            latestStableVersion.buildNumber > currentVersion.buildNumber;
        return;
      }

      var currentVersionList = currentVersion.versionNumber.split('.');
      var latestStableVersionList =
          latestStableVersion.versionNumber.split('.');

      for (var i = 0; i <= 2; i++) {
        forceUpdate = int.parse(latestStableVersionList[i]) >
            int.parse(currentVersionList[i]);

        if (int.parse(latestStableVersionList[i]) !=
            int.parse(currentVersionList[i])) {
          break;
        }
      }
      isForceUpdate = forceUpdate;
    } catch (_) {
      resetValues();
    }
  }
}
