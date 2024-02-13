import '../../../../shared/interface/usecase.interface.dart';
import '../../../core.config.dart';
import '../../data/datasource/core.session.local.datasource.dart';

class CoreInsertUsernameUsecase implements UseCaseInterface<void, String> {
  CoreInsertUsernameUsecase();

  final CoreSessionLocalDatasource datasource =
      CoreConfig.injector<CoreSessionLocalDatasource>();

  @override
  Future<void> call(String username) async {
    return datasource.insertUsername(username);
  }
}
