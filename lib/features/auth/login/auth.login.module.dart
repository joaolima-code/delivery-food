import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.config.dart';
import 'auth.login.page.dart';
import 'cubit/auth.login.cubit.dart';

class AuthLoginModule extends StatelessWidget {
  const AuthLoginModule({super.key});

  static const String route = '/auth/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthLoginCubit>(
      create: (_) => CoreConfig.injector<AuthLoginCubit>(),
      child: const AuthLoginPage(),
    );
  }
}
