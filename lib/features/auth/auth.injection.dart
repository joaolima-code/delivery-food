import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'data/datasource/auth.datasource.dart';
import 'data/repository/auth.repository.dart';
import 'domain/repository/auth.repository.interface.dart';
import 'domain/usecase/auth.getUserMe.usecase.dart';
import 'domain/usecase/auth.login.usecase.dart';
import 'domain/usecase/auth.register.usecase.dart';
import 'presentation/login/cubit/auth.login.cubit.dart';
import 'presentation/register/cubit/auth.register.cubit.dart';

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
    injector.registerLazySingleton(() => AuthDatasource(injector()));
    injector
        .registerLazySingleton<AuthRepositoryInterface>(() => AuthRepository());

    injector.registerLazySingleton(() => AuthLoginUsecase());
    injector.registerLazySingleton(() => AuthRegisterUsecase());
    injector.registerLazySingleton(() => AuthGetUserMeUsecase());

    injector.registerFactory(() => AuthLoginCubit());
    injector.registerFactory(() => AuthRegisterCubit());
  }
}
