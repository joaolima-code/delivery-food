import 'package:json_annotation/json_annotation.dart';

part 'home.simpleRestaurant.response.model.g.dart';

@JsonSerializable()
class HomeSimpleRestaurantResponseModel {
  HomeSimpleRestaurantResponseModel({
    required this.id,
    required this.name,
    required this.typeFood,
    required this.logoPhoto,
    required this.backgroundPhoto,
  });

  factory HomeSimpleRestaurantResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$HomeSimpleRestaurantResponseModelFromJson(json);

  final int id;
  final String name;
  final String typeFood;
  final String logoPhoto;
  final String backgroundPhoto;
}
