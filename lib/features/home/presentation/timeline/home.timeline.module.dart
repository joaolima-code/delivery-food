import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.config.dart';
import 'cubit/home.timeline.cubit.dart';
import 'home.timeline.page.dart';

class HomeTimelineModule extends StatelessWidget {
  const HomeTimelineModule({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTimelineCubit>(
        create: (_) => CoreConfig.injector<HomeTimelineCubit>(),
        child: const HomeTimelinePage());
  }
}
