import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/home.simpleRestaurant.entity.dart';
import '../repository/home.repository.interface.dart';

class HomeGetAllRestaurantUsecase
    implements UseCaseInterface<List<HomeSimpleRestaurantEntity>, String> {
  final HomeRepositoryInterface repository =
      CoreConfig.injector<HomeRepositoryInterface>();

  @override
  Future<List<HomeSimpleRestaurantEntity>> call(String params) async {
    return repository.getAll(params);
  }
}
