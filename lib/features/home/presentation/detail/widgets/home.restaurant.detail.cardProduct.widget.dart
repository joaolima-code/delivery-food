import 'package:flutter/material.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../../../../../shared/widgets/image/image.network.widget.dart';
import '../../../domain/entity/home.product.entity.dart';

class HomeRestaurantDetailCardProductWidget extends StatelessWidget {
  const HomeRestaurantDetailCardProductWidget({
    required this.productEntity,
    super.key,
  });

  final HomeProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
        width: 206,
        child: Card(
            margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: ImageNetworkWidget(
                      urlImage: productEntity.photo,
                      boxFit: BoxFit.fitWidth,
                      boxConstraints: const BoxConstraints(maxHeight: 90))),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(productEntity.name,
                            style: theme.textTheme.titleSmall!
                                .copyWith(height: 1.2)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                  flex: 7,
                                  child: Text(productEntity.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(height: 1.2))),
                              theme.smallSpacingHorizontal,
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                      'R\$${productEntity.price.toStringAsFixed(2)}',
                                      style: theme.textTheme.labelSmall!
                                          .copyWith(
                                              color: theme.colorScheme.error)))
                            ])
                      ]))
            ])));
  }
}
