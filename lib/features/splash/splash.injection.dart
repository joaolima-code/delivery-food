import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'presentation/cubit/splash.cubit.dart';

class SplashInjection extends InjectionInterface {
  SplashInjection(this.injector);

  final GetIt injector;
  static SplashInjection? _defaultInstance;

  static SplashInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = SplashInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerFactory(() => SplashCubit());
  }
}
