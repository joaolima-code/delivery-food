import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../../data/datasource/core.session.local.datasource.dart';

class CoreGetUsernameUsecase implements UseCaseInterface<String?, void> {
  CoreGetUsernameUsecase();

  final CoreSessionLocalDatasource datasource =
      CoreConfig.injector<CoreSessionLocalDatasource>();

  @override
  Future<String?> call(void username) async {
    return datasource.getUsername();
  }
}
