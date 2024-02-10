import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'detail/cubit/restaurant.detail.cubit.dart';

class RestaurantInjection extends InjectionInterface {
  RestaurantInjection(this.injector);

  final GetIt injector;
  static RestaurantInjection? _defaultInstance;

  static RestaurantInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = RestaurantInjection(getIt);
  }

  @override
  Future<void> build() async {
    injector.registerFactory(() => RestaurantDetailCubit());
  }
}
