import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/core.locales.response.model.dart';

part 'core.maps.datasource.g.dart';

@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api')
abstract class CoreMapsDatasource {
  factory CoreMapsDatasource(Dio dio, {String baseUrl}) = _CoreMapsDatasource;

  @GET('/geocode/json')
  Future<CoreLocalesResponseModel> getAddressFromLatLng(
      @Query('latlng') String latlng);
}
