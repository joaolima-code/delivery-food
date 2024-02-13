import '../../../../core/bdLocal/domain/usecase/core.insert.token.usecase.dart';
import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/auth.login.entity.dart';
import '../entity/auth.response.login.entity.dart';
import '../repository/auth.repository.interface.dart';
import 'auth.getUserMe.usecase.dart';

class AuthLoginUsecase
    implements UseCaseInterface<AuthResponseLoginEntity, AuthLoginEntity> {
  final AuthRepositoryInterface repository =
      CoreConfig.injector<AuthRepositoryInterface>();
  final CoreInsertTokenUsecase insertTokenUsecase =
      CoreConfig.injector<CoreInsertTokenUsecase>();
  final AuthGetUserMeUsecase getUserMeUsecase =
      CoreConfig.injector<AuthGetUserMeUsecase>();

  @override
  Future<AuthResponseLoginEntity> call(AuthLoginEntity params) async {
    final AuthResponseLoginEntity response = await repository.login(params);

    if (!response.error) {
      await insertTokenUsecase.call(response.token!);
      await getUserMeUsecase.call(null);
    }

    return response;
  }
}
