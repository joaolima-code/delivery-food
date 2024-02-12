import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/auth.registerUser.entity.dart';
import '../entity/auth.user.entity.dart';
import '../repository/auth.repository.interface.dart';
import 'auth.login.usecase.dart';

class AuthRegisterUsecase
    implements UseCaseInterface<bool, AuthRegisterUserEntity> {
  final AuthRepositoryInterface repository =
      CoreConfig.injector<AuthRepositoryInterface>();
  final AuthLoginUsecase authLoginUsecase =
      CoreConfig.injector<AuthLoginUsecase>();

  @override
  Future<bool> call(AuthRegisterUserEntity params) async {
    final AuthUserEntity? response = await repository.register(params);

    if (response != null) {
      CoreConfig.instance.user = response;

      return true;
    } else {
      return false;
    }
  }
}
