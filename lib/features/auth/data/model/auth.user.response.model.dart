import 'package:json_annotation/json_annotation.dart';

part 'auth.user.response.model.g.dart';

@JsonSerializable()
class AuthUserResponseRequestModel {
  AuthUserResponseRequestModel({
    required this.email,
    required this.id,
    required this.name,
  });

  factory AuthUserResponseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseRequestModelFromJson(json);

  final String name;
  final String email;
  final int id;

  Map<String, dynamic> toJson() => _$AuthUserResponseRequestModelToJson(this);
}
