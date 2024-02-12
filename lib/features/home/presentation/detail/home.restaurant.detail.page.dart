import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/core.navigator.util.dart';
import '../../../../shared/widgets/buttons/back.button.widget.dart';
import '../../../../shared/widgets/image/image.network.widget.dart';
import '../../../../shared/widgets/snackBar/snackbar.widget.dart';
import 'cubit/home.restaurant.detail.cubit.dart';
import 'home.restaurant.detail.args.dart';
import 'widgets/home.restaurant.detail.loadingInitial.widget.dart';
import 'widgets/home.restaurant.detail.mainContent.widget.dart';

class HomeRestaurantDetailPage extends StatefulWidget {
  const HomeRestaurantDetailPage({
    required this.args,
    super.key,
  });

  final HomeRestaurantDetailArgs args;

  @override
  State<HomeRestaurantDetailPage> createState() =>
      _HomeRestaurantDetailPageState();
}

class _HomeRestaurantDetailPageState extends State<HomeRestaurantDetailPage> {
  late HomeRestaurantDetailCubit cubit;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.initState(widget.args.idRestaurant);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<HomeRestaurantDetailCubit>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: BackButtonWidget(color: theme.colorScheme.onPrimary),
          title: Text(widget.args.nameRestaurant.toUpperCase(),
              style: theme.appBarTheme.titleTextStyle!.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700)),
        ),
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.96),
        body:
            BlocConsumer<HomeRestaurantDetailCubit, HomeRestaurantDetailState>(
                listener:
                    (BuildContext context, HomeRestaurantDetailState state) {
          if (state is ErrorToasty) {
            SnackBarWidget.of(context, state.message!).show();

            CoreNavigatorUtil.instance.pop(context);
          }
        }, builder: (BuildContext context, HomeRestaurantDetailState state) {
          if (state is RestaurantDetailInitial) {
            return const HomeRestaurantDetailLoadingInitialWidget();
          }
          return SizedBox(
              child: Stack(children: <Widget>[
            Opacity(
                opacity: 0.80,
                child: ImageNetworkWidget(
                    urlImage: cubit.restaurantEntity.backgroundPhoto,
                    boxFit: BoxFit.cover,
                    boxConstraints: const BoxConstraints(maxHeight: 450))),
            const HomeRestaurantDetailMainContentWidget()
          ]));
        }));
  }
}
