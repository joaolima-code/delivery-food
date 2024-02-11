import 'package:json_annotation/json_annotation.dart';

part 'core.locale.model.g.dart';

@JsonSerializable()
class CoreLocaleModel {
  CoreLocaleModel({
    required this.addressComponents,
    required this.geometry,
  });

  factory CoreLocaleModel.fromJson(Map<String, dynamic> json) =>
      _$CoreLocaleModelFromJson(json);

  @JsonKey(name: 'address_components')
  final List<AddressComponent> addressComponents;

  @JsonKey(name: 'geometry')
  final Geometry geometry;

  Map<String, dynamic> toJson() => _$CoreLocaleModelToJson(this);
}

@JsonSerializable()
class AddressComponent {
  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);

  @JsonKey(name: 'long_name')
  final String longName;

  @JsonKey(name: 'short_name')
  final String shortName;

  final List<String> types;

  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);
}

@JsonSerializable()
class Geometry {
  Geometry({
    required this.location,
    required this.locationType,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  final Location location;

  @JsonKey(name: 'location_type')
  final String locationType;

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final double lat;
  final double lng;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
