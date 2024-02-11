import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../entity/core.getLocale.entity.dart';
import '../entity/core.locale.entity.dart';
import '../repository/core.maps.repository.interface.dart';

class CoreGetLocaleUserUsecase
    implements UseCaseInterface<CoreLocaleEntity?, CoreGetLocaleEntity> {
  final CoreMapsRepositoryInterface repository =
      CoreConfig.injector<CoreMapsRepositoryInterface>();

  @override
  Future<CoreLocaleEntity?> call(CoreGetLocaleEntity params) async {
    final CoreLocaleEntity? response =
        await repository.getLocaleUser(params.latitude, params.longitude);

    if (response != null) {
      CoreConfig.instance.localeUser = response;
    }

    return response;
  }
}
