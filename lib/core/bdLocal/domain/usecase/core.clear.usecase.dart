import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../../data/datasource/core.session.local.datasource.dart';

class CoreClearUsecase implements UseCaseInterface<void, void> {
  CoreClearUsecase();

  final CoreSessionLocalDatasource datasource =
      CoreConfig.injector<CoreSessionLocalDatasource>();

  @override
  Future<void> call(void parameter) async {
    return datasource.clearData();
  }
}
