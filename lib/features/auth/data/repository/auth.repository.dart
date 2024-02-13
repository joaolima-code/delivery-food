import 'package:dio/dio.dart';

import '../../../../core/core.config.dart';
import '../../domain/entity/auth.login.entity.dart';
import '../../domain/entity/auth.registerUser.entity.dart';
import '../../domain/entity/auth.response.login.entity.dart';
import '../../domain/entity/auth.user.entity.dart';
import '../../domain/repository/auth.repository.interface.dart';
import '../datasource/auth.datasource.dart';
import '../model/auth.registerUser.request.model.dart';
import '../model/auth.token.request.model.dart';
import '../model/auth.token.response.model.dart';
import '../model/auth.user.response.model.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthDatasource _datasource = CoreConfig.injector<AuthDatasource>();

  @override
  Future<AuthResponseLoginEntity> login(AuthLoginEntity login) async {
    try {
      final AuthTokenResponseModel response = await _datasource.login(
          AuthTokenRequestModel(email: login.email, password: login.password));

      if (response.token != null) {
        return AuthResponseLoginEntity(error: false, token: response.token);
      } else {
        return AuthResponseLoginEntity(error: true, status: response.status);
      }
    } on DioException catch (_) {
      return AuthResponseLoginEntity(
          error: true,
          status: 'Ocorreu algum erro ao tentar logar, tente novamente');
    }
  }

  @override
  Future<AuthUserEntity?> register(AuthRegisterUserEntity register) async {
    try {
      final AuthUserResponseModel response = await _datasource.register(
          AuthRegisterUserRequestModel(
              email: register.email,
              password: register.password,
              name: register.name));

      final AuthUserEntity entityResponse = AuthUserEntity(
          id: response.id, name: response.name, email: response.email);

      return entityResponse;
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<AuthUserEntity?> userMe() async {
    try {
      final AuthUserResponseModel response = await _datasource.userMe();

      final AuthUserEntity entityResponse = AuthUserEntity(
          id: response.id, name: response.name, email: response.email);

      return entityResponse;
    } on DioException catch (_) {
      return null;
    }
  }
}
