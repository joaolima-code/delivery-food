import '../entity/home.restaurant.entity.dart';
import '../entity/home.simpleRestaurant.entity.dart';

abstract class HomeRepositoryInterface {
  Future<List<HomeSimpleRestaurantEntity>> getAll(String filter);
  Future<HomeRestaurantEntity?> getOne(int id);
}
