import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth.register.state.dart';

class AuthRegisterCubit extends Cubit<AuthRegisterState> {
  AuthRegisterCubit() : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
