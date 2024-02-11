import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'data/datasource/core.maps.datasource.dart';
import 'data/repository/core.maps.repository.dart';
import 'domain/repository/core.maps.repository.interface.dart';
import 'domain/usecase/core.get.localeUser.usecase.dart';

class CoreExternalInjection extends InjectionInterface {
  CoreExternalInjection(this.injector);

  final GetIt injector;
  static CoreExternalInjection? _defaultInstance;

  static CoreExternalInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = CoreExternalInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerLazySingleton(() => CoreMapsDatasource(injector()));
    injector.registerLazySingleton<CoreMapsRepositoryInterface>(
        () => CoreMapsRepository());

    injector.registerLazySingleton(() => CoreGetLocaleUserUsecase());
  }
}
