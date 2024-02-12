import 'package:flutter/material.dart';

import '../../../domain/entity/home.product.entity.dart';
import 'home.restaurant.detail.cardProduct.widget.dart';

class HomeRestaurantDetailListProductWidget extends StatelessWidget {
  HomeRestaurantDetailListProductWidget({
    required this.title,
    required this.listProduct,
    super.key,
  });

  final String title;
  final List<HomeProductEntity> listProduct;

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
                  itemCount: listProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeRestaurantDetailCardProductWidget(
                      productEntity: listProduct[index],
                    );
                  })),
        ]);
  }
}
