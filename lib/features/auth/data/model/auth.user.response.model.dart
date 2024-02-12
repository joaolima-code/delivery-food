import 'package:json_annotation/json_annotation.dart';

part 'auth.user.response.model.g.dart';

@JsonSerializable()
class AuthUserResponseModel {
  AuthUserResponseModel({
    required this.email,
    required this.id,
    required this.name,
  });

  factory AuthUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseModelFromJson(json);

  final String name;
  final String email;
  final int id;
}
