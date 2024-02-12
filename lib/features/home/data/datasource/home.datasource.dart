import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/home.restaurant.response.model.dart';
import '../model/home.simpleRestaurant.response.model.dart';

part 'home.datasource.g.dart';

@RestApi()
abstract class HomeDatasource {
  factory HomeDatasource(Dio dio, {String baseUrl}) = _HomeDatasource;

  @GET('/restaurant')
  Future<List<HomeSimpleRestaurantResponseModel>> getAllRestaurant(
    @Query('query') String query,
  );

  @POST('/restaurant/{id}')
  Future<HomeRestaurantResponseModel> getOneRestaurant(
    @Path('id') int idRestaurant,
  );
}
