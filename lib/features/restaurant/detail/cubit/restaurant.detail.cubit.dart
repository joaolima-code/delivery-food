import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'restaurant.detail.state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  RestaurantDetailCubit() : super(RestaurantDetailInitial());

  late Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;

  Future<void> onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    _mapsController.animateCamera(
        CameraUpdate.newLatLng(const LatLng(-18.910758, -48.317527)));

    markers.add(const Marker(
        markerId: MarkerId('Restaurante'),
        position: LatLng(-18.910758, -48.317527)));

    return emit(Rebuild());
  }
}
