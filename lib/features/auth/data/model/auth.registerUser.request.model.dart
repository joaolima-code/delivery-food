import 'package:json_annotation/json_annotation.dart';

part 'auth.registerUser.request.model.g.dart';

@JsonSerializable()
class AuthRegisterUserRequestModel {
  AuthRegisterUserRequestModel({
    required this.email,
    required this.password,
    required this.name,
  });

  factory AuthRegisterUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRegisterUserRequestModelFromJson(json);

  final String name;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$AuthRegisterUserRequestModelToJson(this);
}
