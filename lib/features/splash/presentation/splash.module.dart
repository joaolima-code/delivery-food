import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.config.dart';
import 'cubit/splash.cubit.dart';
import 'splash.page.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => CoreConfig.injector<SplashCubit>(),
      child: const SplashPage(),
    );
  }
}
