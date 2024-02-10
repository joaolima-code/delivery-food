import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash.state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialState()) {
    checkSessionStatus();
  }

  Future<void> checkSessionStatus() async {
    Future<dynamic>.delayed(const Duration(seconds: 5), () {
      emit(HomeState());
    });
  }
}
