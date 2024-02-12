import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/core.navigator.util.dart';
import '../../../../shared/widgets/buttons/back.button.widget.dart';
import '../../../../shared/widgets/snackBar/snackBar.widget.dart';
import '../../../home/timeline/home.timeline.module.dart';
import '../login/auth.login.module.dart';
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
          title: const Text('Cadastro'), leading: const BackButtonWidget()),
      body: BlocListener<AuthRegisterCubit, AuthRegisterState>(
          listener: (BuildContext context, AuthRegisterState state) {
            if (state is AuthenticationSuccess) {
              CoreNavigatorUtil.instance.startPageWithNewBackStack(
                  context: context, route: HomeTimelineModule.route);
            }
            if (state is ErrorToasty) {
              if (state.errorLogin) {
                SnackBarWidget.of(context, state.message!).show();
                CoreNavigatorUtil.instance.startPageWithNewBackStack(
                    context: context, route: AuthLoginModule.route);
              }
            }
          },
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Center(
                  child: Container(
                      constraints: const BoxConstraints(maxWidth: 480),
                      child: const AuthRegisterFormWidget())))),
    );
  }
}
