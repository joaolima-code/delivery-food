// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.token.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenResponseModel _$AuthTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    AuthTokenResponseModel(
      token: json['token'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AuthTokenResponseModelToJson(
        AuthTokenResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'status': instance.status,
    };
