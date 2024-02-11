import '../../../core.config.dart';
import '../../domain/entity/core.locale.entity.dart';
import '../../domain/repository/core.maps.repository.interface.dart';
import '../datasource/core.maps.datasource.dart';
import '../model/core.locale.model.dart';
import '../model/core.locales.response.model.dart';

class CoreMapsRepository implements CoreMapsRepositoryInterface {
  final CoreMapsDatasource _datasource =
      CoreConfig.injector<CoreMapsDatasource>();

  @override
  Future<CoreLocaleEntity?> getLocaleUser(String lat, String long) async {
    try {
      final CoreLocalesResponseModel data =
          await _datasource.getAddressFromLatLng('$lat,$long');

      final CoreLocaleEntity entity = CoreLocaleEntity(
          address:
              '${data.response.first.addressComponents.firstWhere((AddressComponent element) => element.types.contains('route')).shortName}, ${data.response.first.addressComponents.firstWhere((AddressComponent element) => element.types.contains('street_number')).longName}',
          lat: data.response.first.geometry.location.lat.toString(),
          long: data.response.first.geometry.location.lng.toString());

      return entity;
    } catch (error) {
      return null;
    }
  }
}
