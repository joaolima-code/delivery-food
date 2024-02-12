// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.simpleRestaurant.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSimpleRestaurantResponseModel _$HomeSimpleRestaurantResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeSimpleRestaurantResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      typeFood: json['typeFood'] as String,
      logoPhoto: json['logoPhoto'] as String,
      backgroundPhoto: json['backgroundPhoto'] as String,
    );

Map<String, dynamic> _$HomeSimpleRestaurantResponseModelToJson(
        HomeSimpleRestaurantResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeFood': instance.typeFood,
      'logoPhoto': instance.logoPhoto,
      'backgroundPhoto': instance.backgroundPhoto,
    };
