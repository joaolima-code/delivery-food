import '../../data/model/home.simpleRestaurant.response.model.dart';

class HomeSimpleRestaurantEntity {
  HomeSimpleRestaurantEntity(
      {required this.name,
      required this.id,
      required this.typeFood,
      required this.logoPhoto,
      required this.backgroundPhoto});

  factory HomeSimpleRestaurantEntity.fromModel(
          HomeSimpleRestaurantResponseModel model) =>
      HomeSimpleRestaurantEntity(
        id: model.id,
        name: model.name,
        typeFood: model.typeFood,
        logoPhoto: model.logoPhoto,
        backgroundPhoto: model.backgroudPhoto,
      );

  final int id;
  final String name;
  final String typeFood;
  final String logoPhoto;
  final String backgroundPhoto;
}
