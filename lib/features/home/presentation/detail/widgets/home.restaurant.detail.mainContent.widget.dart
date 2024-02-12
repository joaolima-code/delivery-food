import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../cubit/home.restaurant.detail.cubit.dart';
import 'home.restaurant.detail.info.widget.dart';
import 'home.restaurant.detail.listProduct.widget.dart';

class HomeRestaurantDetailMainContentWidget extends StatefulWidget {
  const HomeRestaurantDetailMainContentWidget({super.key});

  @override
  State<HomeRestaurantDetailMainContentWidget> createState() =>
      _HomeRestaurantDetailMainContentWidgetState();
}

class _HomeRestaurantDetailMainContentWidgetState
    extends State<HomeRestaurantDetailMainContentWidget> {
  late HomeRestaurantDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<HomeRestaurantDetailCubit>();

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height * 0.8),
            margin: const EdgeInsets.only(top: 180),
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24))),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const HomeRestaurantDetailInfoWidget(),
                    theme.bigSpacing,
                    if (cubit
                        .restaurantEntity.foodProducts.isNotEmpty) ...<Widget>[
                      HomeRestaurantDetailListProductWidget(
                          title: 'Pratos',
                          listProduct: cubit.restaurantEntity.foodProducts),
                      theme.bigSpacing,
                    ],
                    if (cubit
                        .restaurantEntity.drinkProducts.isNotEmpty) ...<Widget>[
                      HomeRestaurantDetailListProductWidget(
                          title: 'Bebidas',
                          listProduct: cubit.restaurantEntity.drinkProducts)
                    ]
                  ]),
            )));
  }
}
