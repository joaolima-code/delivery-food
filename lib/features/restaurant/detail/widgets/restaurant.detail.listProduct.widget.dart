import 'package:flutter/material.dart';

import 'restaurant.detail.cardProduct.widget.dart';

class RestaurantDetailListProductWidget extends StatelessWidget {
  RestaurantDetailListProductWidget({
    required this.title,
    super.key,
  });

  final String title;

  final ScrollController _listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: theme.textTheme.titleMedium),
          SizedBox(
              height: 170,
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: _listScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const RestaurantDetailCardProductWidget();
                  })),
        ]);
  }
}
