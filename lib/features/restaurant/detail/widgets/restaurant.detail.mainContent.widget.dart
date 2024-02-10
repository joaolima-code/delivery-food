import 'package:flutter/material.dart';

import '../../../../core/theme/core.theme.style.dart';
import 'restaurant.detail.info.widget.dart';
import 'restaurant.detail.listProduct.widget.dart';

class RestaurantDetailMainContentWidget extends StatefulWidget {
  const RestaurantDetailMainContentWidget({super.key});

  @override
  State<RestaurantDetailMainContentWidget> createState() =>
      _RestaurantDetailMainContentWidgetState();
}

class _RestaurantDetailMainContentWidgetState
    extends State<RestaurantDetailMainContentWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
                    const RestaurantDetailInfoWidget(),
                    theme.bigSpacing,
                    RestaurantDetailListProductWidget(title: 'Pratos'),
                    theme.bigSpacing,
                    RestaurantDetailListProductWidget(title: 'Bebidas')
                  ]),
            )));
  }
}
