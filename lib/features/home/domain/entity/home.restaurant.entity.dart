import '../../data/model/home.restaurant.response.model.dart';
import 'home.simpleRestaurant.entity.dart';

class HomeRestaurantEntity extends HomeSimpleRestaurantEntity {
  HomeRestaurantEntity(
      {required super.name,
      required super.id,
      required super.typeFood,
      required super.logoPhoto,
      required super.backgroundPhoto,
      required this.phone,
      required this.locale,
      required this.review,
      required this.foodProducts,
      required this.drinkProducts});

  factory HomeRestaurantEntity.fromModel(HomeRestaurantResponseModel model) =>
      HomeRestaurantEntity(
          id: model.id,
          name: model.name,
          typeFood: model.typeFood,
          logoPhoto: model.logoPhoto,
          backgroundPhoto: model.backgroundPhoto,
          locale: model.locale,
          phone: model.phone,
          review: model.review,
          foodProducts: model.foodProducts,
          drinkProducts: model.drinkProducts);

  final String phone;
  final String locale;
  final double review;
  final List<dynamic> foodProducts;
  final List<dynamic> drinkProducts;
}
