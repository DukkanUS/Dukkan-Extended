import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

class Helper {
  static Future<bool> grantLocationPermission({
    bool shouldGoToSettings = true,
  }) async {
    const timeOut = Duration(seconds: 10);

    var isGranted = false;

    try {
      var isLocationServiceEnabled =
          await Location().serviceEnabled().timeout(timeOut);
      if (!isLocationServiceEnabled) {
        isLocationServiceEnabled =
            await Location().requestService().timeout(timeOut);
      }
      if (isLocationServiceEnabled) {
        var permissionStatus = await permission_handler
            .Permission.locationWhenInUse.status
            .timeout(timeOut);

        if (!permissionStatus.isGranted &&
            !permissionStatus.isPermanentlyDenied) {
          permissionStatus = await permission_handler
              .Permission.locationWhenInUse
              .request()
              .timeout(timeOut);
        }

        isGranted = permissionStatus.isGranted;
        if (permissionStatus.isPermanentlyDenied && shouldGoToSettings) {
          await permission_handler.openAppSettings();
        }
      }
    } catch (_) {}
    return isGranted;
  }

  // static Future<LatLng> getCurrentLocation({
  //   bool shouldGoToSettings = true,
  // }) async {
  //   Position? position = await Geolocator.getLastKnownPosition();
  // }
}
