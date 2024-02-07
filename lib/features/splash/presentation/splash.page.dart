import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.config.dart';
import '../../../core/util/core.navigator.util.dart';
import '../../home/home.module.dart';
import 'cubit/splash.cubit.dart';
import 'cubit/splash.state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashCubit cubit = CoreConfig.injector<SplashCubit>();

  @override
  void initState() {
    cubit.checkSessionStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => cubit,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is HomeState) {
            CoreNavigatorUtil.instance.startPageWithNewBackStack(
                context: context, route: HomeModule.route);
          }
          if (state is AuthenticateState) {}
        },
        child: Scaffold(backgroundColor: Colors.amber.shade200),
      ),
    );
  }
}
