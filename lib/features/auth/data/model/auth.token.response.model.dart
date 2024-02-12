import 'package:json_annotation/json_annotation.dart';

part 'auth.token.response.model.g.dart';

@JsonSerializable()
class AuthTokenResponseModel {
  AuthTokenResponseModel({this.token, this.status});

  final String? token;
  final String? status;

  Map<String, dynamic> toJson() => _$AuthTokenResponseModelToJson(this);
}
