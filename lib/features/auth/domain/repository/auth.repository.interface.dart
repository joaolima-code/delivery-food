import '../entity/auth.login.entity.dart';
import '../entity/auth.registerUser.entity.dart';
import '../entity/auth.response.login.entity.dart';
import '../entity/auth.user.entity.dart';

abstract class AuthRepositoryInterface {
  Future<AuthResponseLoginEntity> login(AuthLoginEntity authLogin);
  Future<AuthUserEntity?> register(AuthRegisterUserEntity register);
  Future<AuthUserEntity?> userMe();
}
