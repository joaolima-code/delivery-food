import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'data/datasource/core.session.local.datasource.dart';
import 'data/encryption/core.generate.secure.key.dart';
import 'data/encryption/core.hive.secure.key.dart';
import 'domain/usecase/core.clear.usecase.dart';
import 'domain/usecase/core.get.token.usecase.dart';
import 'domain/usecase/core.get.username.usecase.dart';
import 'domain/usecase/core.insert.token.usecase.dart';
import 'domain/usecase/core.insert.username.usecase.dart';

class CoreBdLocalInjection extends InjectionInterface {
  CoreBdLocalInjection(this.injector);

  final GetIt injector;
  static CoreBdLocalInjection? _defaultInstance;

  static const String secureKey = 'app.key.SECURE_KEY';

  static CoreBdLocalInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = CoreBdLocalInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerSingleton(CoreGenerateSecureKey());

    injector.registerSingleton(
      CoreHiveCreateSecureKey(key: secureKey),
    );

    injector.registerLazySingleton(() => CoreSessionLocalDatasource());

    injector.registerLazySingleton(() => CoreGetTokenUsecase());
    injector.registerLazySingleton(() => CoreInsertTokenUsecase());
    injector.registerLazySingleton(() => CoreGetUsernameUsecase());
    injector.registerLazySingleton(() => CoreInsertUsernameUsecase());
    injector.registerLazySingleton(() => CoreClearUsecase());
  }
}
