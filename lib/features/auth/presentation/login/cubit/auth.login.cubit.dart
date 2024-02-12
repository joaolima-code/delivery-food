import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core.config.dart';
import '../../../domain/entity/auth.login.entity.dart';
import '../../../domain/entity/auth.response.login.entity.dart';
import '../../../domain/usecase/auth.login.usecase.dart';

part 'auth.login.state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit() : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthLoginUsecase _loginUsecase =
      CoreConfig.injector<AuthLoginUsecase>();

  Future<void> onSubmitted() async {
    emit(Loading());

    final AuthResponseLoginEntity response = await _loginUsecase.call(
        AuthLoginEntity(
            email: emailController.text, password: passwordController.text));

    if (!response.error) {
      return emit(AuthenticationSuccess('Login realizado com sucesso!'));
    } else {
      return emit(ErrorToasty(response.status));
    }
  }
}
