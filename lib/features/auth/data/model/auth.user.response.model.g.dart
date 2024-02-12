// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.user.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserResponseModel _$AuthUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    AuthUserResponseModel(
      email: json['email'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AuthUserResponseModelToJson(
        AuthUserResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
    };
