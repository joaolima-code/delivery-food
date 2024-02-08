import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'login/cubit/auth.login.cubit.dart';
import 'register/cubit/auth.register.cubit.dart';

class AuthInjection extends InjectionInterface {
  AuthInjection(this.injector);

  final GetIt injector;
  static AuthInjection? _defaultInstance;

  static AuthInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = AuthInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerFactory(() => AuthLoginCubit());
    injector.registerFactory(() => AuthRegisterCubit());
  }
}
