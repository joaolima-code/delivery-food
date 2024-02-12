import 'package:json_annotation/json_annotation.dart';

part 'home.product.response.model.g.dart';

@JsonSerializable()
class HomeProductResponseModel {
  HomeProductResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
  });

  factory HomeProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductResponseModelFromJson(json);

  final int id;
  final String name;
  final String description;
  final double price;
  final String photo;
}
