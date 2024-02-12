// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.product.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductResponseModel _$HomeProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeProductResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$HomeProductResponseModelToJson(
        HomeProductResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'photo': instance.photo,
    };
