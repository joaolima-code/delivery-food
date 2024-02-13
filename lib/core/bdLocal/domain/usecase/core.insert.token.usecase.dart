import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../../data/datasource/core.session.local.datasource.dart';

class CoreInsertTokenUsecase implements UseCaseInterface<void, String> {
  CoreInsertTokenUsecase();

  final CoreSessionLocalDatasource datasource =
      CoreConfig.injector<CoreSessionLocalDatasource>();

  @override
  Future<void> call(String token) async {
    return datasource.insertToken(token);
  }
}
