import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../../data/datasource/core.session.local.datasource.dart';

class CoreGetTokenUsecase implements UseCaseInterface<String?, void> {
  CoreGetTokenUsecase();

  final CoreSessionLocalDatasource datasource =
      CoreConfig.injector<CoreSessionLocalDatasource>();

  @override
  Future<String?> call(void token) async {
    return datasource.getToken();
  }
}
