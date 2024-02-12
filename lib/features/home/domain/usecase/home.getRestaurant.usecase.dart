import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/home.restaurant.entity.dart';
import '../repository/home.repository.interface.dart';

class HomeGetRestaurantUsecase
    implements UseCaseInterface<HomeRestaurantEntity?, int> {
  final HomeRepositoryInterface repository =
      CoreConfig.injector<HomeRepositoryInterface>();

  @override
  Future<HomeRestaurantEntity?> call(int params) async {
    return repository.getOne(params);
  }
}
