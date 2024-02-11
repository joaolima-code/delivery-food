import '../entity/core.locale.entity.dart';

abstract class CoreMapsRepositoryInterface {
  Future<CoreLocaleEntity?> getLocaleUser(String lat, String long);
}
