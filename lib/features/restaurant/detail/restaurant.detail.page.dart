import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/buttons/back.button.widget.dart';
import '../../../shared/widgets/image/image.network.widget.dart';
import 'cubit/restaurant.detail.cubit.dart';
import 'restaurant.detail.args.dart';
import 'widgets/restaurant.detail.loadingInitial.widget.dart';
import 'widgets/restaurant.detail.mainContent.widget.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({
    required this.args,
    super.key,
  });

  final RestaurantDetailArgs args;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: BackButtonWidget(color: theme.colorScheme.onPrimary),
          title: Text('Nome do restaurante'.toUpperCase(),
              style: theme.appBarTheme.titleTextStyle!.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700)),
        ),
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.96),
        body: BlocConsumer<RestaurantDetailCubit, RestaurantDetailState>(
            listener: (BuildContext context, RestaurantDetailState state) {
          // TODO: implement listener
        }, builder: (BuildContext context, RestaurantDetailState state) {
          if (state is RestaurantDetailInitial) {
            return const RestaurantDetailLoadingInitialWidget();
          }
          return const SizedBox(
            child: Stack(children: <Widget>[
              Opacity(
                  opacity: 0.80,
                  child: ImageNetworkWidget(
                      urlImage:
                          'https://www.gastronomia.com.br/wp-content/uploads/2023/07/comida-brasileira-10-pratos-tipicos-famosos-do-brasil.jpg',
                      boxFit: BoxFit.cover,
                      boxConstraints: BoxConstraints(maxHeight: 450))),
              RestaurantDetailMainContentWidget()
            ]),
          );
        }));
  }
}
