import 'package:flutter/material.dart';

import '../../../../core/theme/core.theme.style.dart';
import '../../../../shared/widgets/image/image.network.widget.dart';

class RestaurantDetailCardProductWidget extends StatelessWidget {
  const RestaurantDetailCardProductWidget({super.key});

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
              const ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: ImageNetworkWidget(
                      urlImage:
                          'https://www.gastronomia.com.br/wp-content/uploads/2023/07/comida-brasileira-10-pratos-tipicos-famosos-do-brasil.jpg',
                      boxFit: BoxFit.cover,
                      boxConstraints: BoxConstraints(maxHeight: 130))),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Strogonoff',
                            style: theme.textTheme.titleSmall!
                                .copyWith(height: 1.2)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                  flex: 7,
                                  child: Text('Arroz, batata frita e carne',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(height: 1.2))),
                              theme.smallSpacingHorizontal,
                              Expanded(
                                  flex: 3,
                                  child: Text(r'R$200,20',
                                      style: theme.textTheme.labelSmall!
                                          .copyWith(
                                              color: theme.colorScheme.error)))
                            ])
                      ]))
            ])));
  }
}
