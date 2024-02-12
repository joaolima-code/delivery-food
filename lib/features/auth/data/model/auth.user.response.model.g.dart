// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.user.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserResponseRequestModel _$AuthUserResponseRequestModelFromJson(
        Map<String, dynamic> json) =>
    AuthUserResponseRequestModel(
      email: json['email'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AuthUserResponseRequestModelToJson(
        AuthUserResponseRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
    };
