// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.token.request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenRequestModel _$AuthTokenRequestModelFromJson(
        Map<String, dynamic> json) =>
    AuthTokenRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthTokenRequestModelToJson(
        AuthTokenRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
