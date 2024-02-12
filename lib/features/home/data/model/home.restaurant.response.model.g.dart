// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.restaurant.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRestaurantResponseModel _$HomeRestaurantResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeRestaurantResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      typeFood: json['typeFood'] as String,
      logoPhoto: json['logoPhoto'] as String,
      backgroundPhoto: json['backgroundPhoto'] as String,
      phone: json['phone'] as String,
      locale: json['locale'] as String,
      review: (json['review'] as num).toDouble(),
      foodProducts: (json['foodProducts'] as List<dynamic>)
          .map((e) =>
              HomeProductResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinkProducts: (json['drinkProducts'] as List<dynamic>)
          .map((e) =>
              HomeProductResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeRestaurantResponseModelToJson(
        HomeRestaurantResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeFood': instance.typeFood,
      'logoPhoto': instance.logoPhoto,
      'backgroundPhoto': instance.backgroundPhoto,
      'phone': instance.phone,
      'locale': instance.locale,
      'review': instance.review,
      'foodProducts': instance.foodProducts,
      'drinkProducts': instance.drinkProducts,
    };
