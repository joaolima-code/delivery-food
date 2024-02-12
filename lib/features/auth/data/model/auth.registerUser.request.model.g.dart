// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.registerUser.request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRegisterUserRequestModel _$AuthRegisterUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    AuthRegisterUserRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AuthRegisterUserRequestModelToJson(
        AuthRegisterUserRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
