import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core.config.dart';
import '../../../domain/entity/auth.login.entity.dart';
import '../../../domain/entity/auth.registerUser.entity.dart';
import '../../../domain/entity/auth.response.login.entity.dart';
import '../../../domain/usecase/auth.login.usecase.dart';
import '../../../domain/usecase/auth.register.usecase.dart';

part 'auth.register.state.dart';

class AuthRegisterCubit extends Cubit<AuthRegisterState> {
  AuthRegisterCubit() : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRegisterUsecase _registerUsecase =
      CoreConfig.injector<AuthRegisterUsecase>();
  final AuthLoginUsecase _loginUsecase =
      CoreConfig.injector<AuthLoginUsecase>();

  Future<void> onSubmitted() async {
    emit(Loading());

    final bool response = await _registerUsecase.call(AuthRegisterUserEntity(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text));

    if (response) {
      final AuthResponseLoginEntity responseAuth = await _loginUsecase.call(
          AuthLoginEntity(
              email: emailController.text, password: passwordController.text));

      if (!responseAuth.error) {
        return emit(AuthenticationSuccess('Login realizado com sucesso!'));
      } else {
        return emit(ErrorToasty(
            'Conta criada com sucesso, mas tivemos um erro ao tentar fazer login.',
            errorLogin: true));
      }
    } else {
      return emit(ErrorToasty(
          'Ocorreu algum erro na criação da conta. Tente novamente mais tarde!'));
    }
  }
}
