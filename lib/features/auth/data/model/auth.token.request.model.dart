import 'package:json_annotation/json_annotation.dart';

part 'auth.token.request.model.g.dart';

@JsonSerializable()
class AuthTokenRequestModel {
  AuthTokenRequestModel({required this.email, required this.password});

  factory AuthTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenRequestModelFromJson(json);

  final String email;

  final String password;

  Map<String, dynamic> toJson() => _$AuthTokenRequestModelToJson(this);
}
