part of 'auth.register.cubit.dart';

abstract class AuthRegisterState {}

class InitialState extends AuthRegisterState {}

class Loading extends AuthRegisterState {}

class AuthenticationSuccess extends AuthRegisterState {
  AuthenticationSuccess(this.message);

  final String? message;
}

class ErrorToasty extends AuthRegisterState {
  ErrorToasty(this.message, {this.errorLogin = false});

  final String? message;
  final bool errorLogin;
}
