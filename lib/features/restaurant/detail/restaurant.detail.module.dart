import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.config.dart';
import 'cubit/restaurant.detail.cubit.dart';
import 'restaurant.detail.args.dart';
import 'restaurant.detail.page.dart';

class RestaurantDetailModule extends StatelessWidget {
  const RestaurantDetailModule({super.key});

  static const String route = '/restaurant';

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailArgs args =
        ModalRoute.of(context)!.settings.arguments! as RestaurantDetailArgs;

    return BlocProvider<RestaurantDetailCubit>(
        create: (_) => CoreConfig.injector<RestaurantDetailCubit>(),
        child: RestaurantDetailPage(args: args));
  }
}
