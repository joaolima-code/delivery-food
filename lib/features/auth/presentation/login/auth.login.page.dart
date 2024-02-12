import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/core.navigator.util.dart';
import '../../../../shared/widgets/buttons/back.button.widget.dart';
import '../../../../shared/widgets/snackBar/snackBar.widget.dart';
import '../../../home/presentation/timeline/home.timeline.module.dart';
import 'cubit/auth.login.cubit.dart';
import 'widgets/auth.login.form.widget.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Entrar'), leading: const BackButtonWidget()),
        body: BlocListener<AuthLoginCubit, AuthLoginState>(
            listener: (BuildContext context, AuthLoginState state) {
              if (state is AuthenticationSuccess) {
                CoreNavigatorUtil.instance.startPageWithNewBackStack(
                    context: context, route: HomeTimelineModule.route);
              }
              if (state is ErrorToasty) {
                SnackBarWidget.of(context, state.message!).show();
              }
            },
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Center(
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: const AuthLoginFormWidget())))));
  }
}
