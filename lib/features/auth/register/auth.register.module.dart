import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.config.dart';
import 'auth.register.page.dart';
import 'cubit/auth.register.cubit.dart';

class AuthRegisterModule extends StatelessWidget {
  const AuthRegisterModule({super.key});

  static const String route = '/auth/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthRegisterCubit>(
        create: (_) => CoreConfig.injector<AuthRegisterCubit>(),
        child: const AuthRegisterPage());
  }
}
