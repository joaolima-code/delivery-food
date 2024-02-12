import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'data/datasource/home.datasource.dart';
import 'data/repository/home.repository.dart';
import 'domain/repository/home.repository.interface.dart';
import 'domain/usecase/home.getAllRestaurant.usecase.dart';
import 'domain/usecase/home.getRestaurant.usecase.dart';
import 'presentation/detail/cubit/home.restaurant.detail.cubit.dart';
import 'presentation/timeline/cubit/home.timeline.cubit.dart';

class HomeInjection extends InjectionInterface {
  HomeInjection(this.injector);

  final GetIt injector;
  static HomeInjection? _defaultInstance;

  static HomeInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = HomeInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerLazySingleton(() => HomeDatasource(injector()));
    injector
        .registerLazySingleton<HomeRepositoryInterface>(() => HomeRepository());

    injector.registerLazySingleton(() => HomeGetAllRestaurantUsecase());
    injector.registerLazySingleton(() => HomeGetRestaurantUsecase());

    injector.registerFactory(() => HomeTimelineCubit());
    injector.registerFactory(() => HomeRestaurantDetailCubit());
  }
}
