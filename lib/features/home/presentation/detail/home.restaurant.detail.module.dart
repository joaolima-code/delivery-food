import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.config.dart';
import 'cubit/home.restaurant.detail.cubit.dart';
import 'home.restaurant.detail.args.dart';
import 'home.restaurant.detail.page.dart';

class HomeRestaurantDetailModule extends StatelessWidget {
  const HomeRestaurantDetailModule({super.key});

  static const String route = '/restaurant';

  @override
  Widget build(BuildContext context) {
    final HomeRestaurantDetailArgs args =
        ModalRoute.of(context)!.settings.arguments! as HomeRestaurantDetailArgs;

    return BlocProvider<HomeRestaurantDetailCubit>(
        create: (_) => CoreConfig.injector<HomeRestaurantDetailCubit>(),
        child: HomeRestaurantDetailPage(args: args));
  }
}
