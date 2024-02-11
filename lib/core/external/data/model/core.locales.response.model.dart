import 'package:json_annotation/json_annotation.dart';

import 'core.locale.model.dart';

part 'core.locales.response.model.g.dart';

@JsonSerializable()
class CoreLocalesResponseModel {
  CoreLocalesResponseModel({required this.response});

  factory CoreLocalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoreLocalesResponseModelFromJson(json);

  @JsonKey(name: 'results')
  final List<CoreLocaleModel> response;
}
