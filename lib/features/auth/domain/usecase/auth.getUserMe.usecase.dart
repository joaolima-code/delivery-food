import '../../../../core/bdLocal/domain/usecase/core.insert.username.usecase.dart';
import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/auth.user.entity.dart';
import '../repository/auth.repository.interface.dart';

class AuthGetUserMeUsecase implements UseCaseInterface<AuthUserEntity?, void> {
  final AuthRepositoryInterface repository =
      CoreConfig.injector<AuthRepositoryInterface>();
  final CoreInsertUsernameUsecase insertUsernameUsecase =
      CoreConfig.injector<CoreInsertUsernameUsecase>();

  @override
  Future<AuthUserEntity?> call(void params) async {
    final AuthUserEntity? response = await repository.userMe();

    if (response != null) {
      await insertUsernameUsecase.call(response.name);
    }

    return response;
  }
}
