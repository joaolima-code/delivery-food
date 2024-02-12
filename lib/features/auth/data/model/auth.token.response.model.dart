import 'package:json_annotation/json_annotation.dart';

part 'auth.token.response.model.g.dart';

@JsonSerializable()
class AuthTokenResponseModel {
  AuthTokenResponseModel({this.token, this.status});

  factory AuthTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseModelFromJson(json);

  final String? token;
  final String? status;
}
