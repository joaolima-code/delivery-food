import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/core.config.dart';
import '../../../domain/entity/home.restaurant.entity.dart';
import '../../../domain/usecase/home.getRestaurant.usecase.dart';

part 'home.restaurant.detail.state.dart';

class HomeRestaurantDetailCubit extends Cubit<HomeRestaurantDetailState> {
  HomeRestaurantDetailCubit() : super(RestaurantDetailInitial());

  late Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;
  late HomeRestaurantEntity restaurantEntity;

  final HomeGetRestaurantUsecase _getRestaurantUsecase =
      CoreConfig.injector<HomeGetRestaurantUsecase>();

  Future<void> onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    _mapsController
        .animateCamera(CameraUpdate.newLatLng(restaurantEntity.locale));

    markers.add(Marker(
        markerId: const MarkerId('Restaurante'),
        position: restaurantEntity.locale));

    return emit(Rebuild());
  }

  Future<void> initState(int id) async {
    await getRestaurant(id);
  }

  Future<void> getRestaurant(int id) async {
    final HomeRestaurantEntity? response = await _getRestaurantUsecase.call(id);

    if (response != null) {
      restaurantEntity = response;

      return emit(Rebuild());
    } else {
      return emit(ErrorToasty('Ocorreu algum erro. Tente novamente'));
    }
  }
}
