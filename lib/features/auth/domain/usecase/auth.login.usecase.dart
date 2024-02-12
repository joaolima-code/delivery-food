import '../../../../core/core.config.dart';
import '../../../../shared/interface/usecase.interface.dart';
import '../entity/auth.login.entity.dart';
import '../entity/auth.response.login.entity.dart';
import '../repository/auth.repository.interface.dart';

class AuthLoginUsecase
    implements UseCaseInterface<AuthResponseLoginEntity, AuthLoginEntity> {
  final AuthRepositoryInterface repository =
      CoreConfig.injector<AuthRepositoryInterface>();

  @override
  Future<AuthResponseLoginEntity> call(AuthLoginEntity params) async {
    final AuthResponseLoginEntity response = await repository.login(params);

    if (!response.error) {
      CoreConfig.instance.token = response.token!;
    }

    return response;
  }
}
