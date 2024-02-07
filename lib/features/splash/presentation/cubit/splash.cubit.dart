import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'splash.state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialState());

  Future<void> checkSessionStatus() async {
    emit(HomeState());

    return FlutterNativeSplash.remove();
  }
}
