import 'package:dio/dio.dart';

import '../../../../core/core.config.dart';
import '../../domain/entity/home.restaurant.entity.dart';
import '../../domain/entity/home.simpleRestaurant.entity.dart';
import '../../domain/repository/home.repository.interface.dart';
import '../datasource/home.datasource.dart';
import '../model/home.restaurant.response.model.dart';
import '../model/home.simpleRestaurant.response.model.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeDatasource _datasource = CoreConfig.injector<HomeDatasource>();

  @override
  Future<List<HomeSimpleRestaurantEntity>> getAll(String filter) async {
    try {
      final List<HomeSimpleRestaurantResponseModel> response =
          await _datasource.getAllRestaurant(filter);

      final List<HomeSimpleRestaurantEntity> responseEntity = response
          .map((HomeSimpleRestaurantResponseModel simpleRestaurant) =>
              HomeSimpleRestaurantEntity.fromModel(simpleRestaurant))
          .toList();

      return responseEntity;
    } on DioException catch (_) {
      return <HomeSimpleRestaurantEntity>[];
    }
  }

  @override
  Future<HomeRestaurantEntity?> getOne(int id) async {
    try {
      final HomeRestaurantResponseModel response =
          await _datasource.getOneRestaurant(id);

      final HomeRestaurantEntity responseEntity =
          HomeRestaurantEntity.fromModel(response);

      return responseEntity;
    } on DioException catch (_) {
      return null;
    }
  }
}
