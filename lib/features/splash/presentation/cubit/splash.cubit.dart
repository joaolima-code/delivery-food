import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'splash.state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialState()) {
    initState();
  }

  Future<void> initState() async {
    await _checkPermissionLocale();
    checkSessionStatus();
  }

  Future<void> checkSessionStatus() async {
    emit(HomeState());
  }

  Future<void> _checkPermissionLocale() async {
    LocationPermission locationPermission;

    final bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      return;
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
    }

    return;
  }
}
