import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoreUtilLatLongHelper {
  CoreUtilLatLongHelper._internal();

  static final CoreUtilLatLongHelper _singleton =
      CoreUtilLatLongHelper._internal();
  static CoreUtilLatLongHelper get instance => _singleton;

  static LatLng extractLatLng(String input) {
    final RegExp regex = RegExp(r'([-+]?\d*\.\d+|\d+), ([-+]?\d*\.\d+|\d+)');
    final Match? match = regex.firstMatch(input);

    if (match != null) {
      final double latitude = double.parse(match.group(1)!);
      final double longitude = double.parse(match.group(2)!);
      return LatLng(latitude, longitude);
    }

    return const LatLng(-18.921404, -48.269749);
  }
}
