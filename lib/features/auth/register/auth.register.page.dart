import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/core.navigator.util.dart';
import 'cubit/auth.register.cubit.dart';
import 'widgets/auth.register.form.widget.dart';

class AuthRegisterPage extends StatefulWidget {
  const AuthRegisterPage({super.key});

  @override
  State<AuthRegisterPage> createState() => _AuthRegisterPageState();
}

class _AuthRegisterPageState extends State<AuthRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro'),
          leading: IconButton(
              onPressed: () => CoreNavigatorUtil.instance.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded))),
      body: BlocListener<AuthRegisterCubit, AuthRegisterState>(
          listener: (BuildContext context, AuthRegisterState state) {},
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Center(
                  child: Container(
                      constraints: const BoxConstraints(maxWidth: 480),
                      child: const AuthRegisterFormWidget())))),
    );
  }
}
