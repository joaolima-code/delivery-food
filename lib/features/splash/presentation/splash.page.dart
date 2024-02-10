import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../core/util/core.navigator.util.dart';
import '../../auth/initial/auth.initial.module.dart';
import '../../home/timeline/home.timeline.module.dart';
import 'cubit/splash.cubit.dart';
import 'cubit/splash.state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listener: (BuildContext context, SplashState state) {
          FlutterNativeSplash.remove();

          if (state is HomeState) {
            CoreNavigatorUtil.instance.startPageWithNewBackStack(
                context: context, route: HomeTimelineModule.route);
          }
          if (state is AuthenticateState) {
            CoreNavigatorUtil.instance.startPageWithNewBackStack(
                context: context, route: AuthInitialModule.route);
          }
        },
        child:
            Scaffold(backgroundColor: Theme.of(context).colorScheme.onPrimary));
  }
}
