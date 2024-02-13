import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoreUtilLatLongHelper {
  CoreUtilLatLongHelper._internal();

  static final CoreUtilLatLongHelper _singleton =
      CoreUtilLatLongHelper._internal();
  static CoreUtilLatLongHelper get instance => _singleton;

  static LatLng extractLatLng(String input) {
    final int commaIndex = input.indexOf(',');

    if (commaIndex != -1) {
      final double latitude =
          double.parse(input.substring(0, commaIndex).trim());
      final double longitude =
          double.parse(input.substring(commaIndex + 1).trim());

      return LatLng(latitude, longitude);
    }

    return const LatLng(-18.921404, -48.269749);
  }
}
