part of 'auth.login.cubit.dart';

abstract class AuthLoginState {}

class InitialState extends AuthLoginState {}

class Loading extends AuthLoginState {}

class AuthenticationSuccess extends AuthLoginState {
  AuthenticationSuccess(this.message);

  final String? message;
}

class ErrorToasty extends AuthLoginState {
  ErrorToasty(this.message);

  final String? message;
}
