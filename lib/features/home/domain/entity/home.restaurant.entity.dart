import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/util/helpers/core.util.latLong.helper.dart';
import '../../data/model/home.product.response.model.dart';
import '../../data/model/home.restaurant.response.model.dart';
import 'home.product.entity.dart';
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
        backgroundPhoto: model.backgroudPhoto,
        locale: CoreUtilLatLongHelper.extractLatLng(model.locale),
        phone: model.phone,
        review: model.review,
        foodProducts: model.foodProducts
            .map((HomeProductResponseModel model) =>
                HomeProductEntity.fromModel(model))
            .toList(),
        drinkProducts: model.drinkProducts
            .map((HomeProductResponseModel model) =>
                HomeProductEntity.fromModel(model))
            .toList(),
      );

  final String phone;
  final LatLng locale;
  final double review;
  final List<HomeProductEntity> foodProducts;
  final List<HomeProductEntity> drinkProducts;
}
