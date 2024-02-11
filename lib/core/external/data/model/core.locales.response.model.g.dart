// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.locales.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreLocalesResponseModel _$CoreLocalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CoreLocalesResponseModel(
      response: (json['results'] as List<dynamic>)
          .map((e) => CoreLocaleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreLocalesResponseModelToJson(
        CoreLocalesResponseModel instance) =>
    <String, dynamic>{
      'results': instance.response,
    };
