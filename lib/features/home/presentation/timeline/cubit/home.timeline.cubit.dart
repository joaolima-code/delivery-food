import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/core.config.dart';
import '../../../../../core/external/domain/entity/core.getLocale.entity.dart';
import '../../../../../core/external/domain/entity/core.locale.entity.dart';
import '../../../../../core/external/domain/usecase/core.get.localeUser.usecase.dart';
import '../../../domain/entity/home.simpleRestaurant.entity.dart';
import '../../../domain/usecase/home.getAllRestaurant.usecase.dart';

part 'home.timeline.state.dart';

class HomeTimelineCubit extends Cubit<HomeTimelineState> {
  HomeTimelineCubit() : super(HomeInitial()) {
    initState();
  }

  final CoreGetLocaleUserUsecase _coreGetLocaleUserUsecase =
      CoreConfig.injector<CoreGetLocaleUserUsecase>();
  final HomeGetAllRestaurantUsecase _getAllRestaurantUsecase =
      CoreConfig.injector<HomeGetAllRestaurantUsecase>();

  final TextEditingController searchController = TextEditingController();

  late Position _positionUser;
  late String? address = 'Buscando localização';
  late List<HomeSimpleRestaurantEntity> listRestaurant =
      <HomeSimpleRestaurantEntity>[];

  Future<void> initState() async {
    _getAddressFromLatLng();
    await getListRestaurant();

    searchController.addListener(() {
      getListRestaurant();
    });
  }

  @override
  Future<void> close() async {
    searchController.clear();
    super.close();
  }

  Future<void> _getAddressFromLatLng() async {
    _positionUser = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final CoreLocaleEntity? locale = await _coreGetLocaleUserUsecase.call(
        CoreGetLocaleEntity(
            latitude: _positionUser.latitude.toString(),
            longitude: _positionUser.longitude.toString()));

    if (locale != null) {
      address = locale.address;
    } else {
      address = 'Não encontramos a localização';
    }

    return emit(Rebuild());
  }

  Future<void> getListRestaurant() async {
    emit(Loading());

    final List<HomeSimpleRestaurantEntity> response =
        await _getAllRestaurantUsecase.call(searchController.text);

    if (response.isNotEmpty) {
      listRestaurant = response;

      return emit(Rebuild());
    } else {
      return emit(ErrorToasty('Nenhum restaurante encontrado'));
    }
  }
}
