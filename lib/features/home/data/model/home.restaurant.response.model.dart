import 'package:json_annotation/json_annotation.dart';

import 'home.product.response.model.dart';
import 'home.simpleRestaurant.response.model.dart';

part 'home.restaurant.response.model.g.dart';

@JsonSerializable()
class HomeRestaurantResponseModel extends HomeSimpleRestaurantResponseModel {
  HomeRestaurantResponseModel({
    required super.id,
    required super.name,
    required super.typeFood,
    required super.logoPhoto,
    required super.backgroundPhoto,
    required this.phone,
    required this.locale,
    required this.review,
    required this.foodProducts,
    required this.drinkProducts,
  });

  factory HomeRestaurantResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeRestaurantResponseModelFromJson(json);

  final String phone;
  final String locale;
  final double review;
  final List<HomeProductResponseModel> foodProducts;
  final List<HomeProductResponseModel> drinkProducts;
}
