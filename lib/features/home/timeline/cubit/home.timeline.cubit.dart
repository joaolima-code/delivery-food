import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/core.config.dart';
import '../../../../core/external/domain/entity/core.getLocale.entity.dart';
import '../../../../core/external/domain/entity/core.locale.entity.dart';
import '../../../../core/external/domain/usecase/core.get.localeUser.usecase.dart';

part 'home.timeline.state.dart';

class HomeTimelineCubit extends Cubit<HomeTimelineState> {
  HomeTimelineCubit() : super(HomeInitial()) {
    _getAddressFromLatLng();
  }

  final CoreGetLocaleUserUsecase _coreGetLocaleUserUsecase =
      CoreConfig.injector<CoreGetLocaleUserUsecase>();

  late Position _positionUser;
  late String? address = 'Buscando localização';

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
}
