import 'package:get_it/get_it.dart';

import '../../core/injection/injection.interface.dart';
import 'timeline/cubit/home.timeline.cubit.dart';

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
    injector.registerFactory(() => HomeTimelineCubit());
  }
}
