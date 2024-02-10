import 'package:flutter/material.dart';

import '../../../../core/theme/core.theme.style.dart';
import '../../../../shared/widgets/image/image.network.widget.dart';

class RestaurantDetailInfoWidget extends StatefulWidget {
  const RestaurantDetailInfoWidget({super.key});

  @override
  State<RestaurantDetailInfoWidget> createState() =>
      _RestaurantDetailInfoWidgetState();
}

class _RestaurantDetailInfoWidgetState
    extends State<RestaurantDetailInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            const CircleAvatar(
                radius: 25,
                child: ClipOval(
                    child: ImageNetworkWidget(
                        urlImage:
                            'https://blog.agenciadosite.com.br/wp-content/uploads/2017/01/logo-gallus.jpg',
                        width: 50,
                        height: 50))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: theme.dividerHorizontal(20)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Restaurante Gallus',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('Comida brasileira',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(height: 1)),
                  Text('(34) 99888-6018',
                      style: Theme.of(context).textTheme.bodySmall)
                ]),
          ],
        ),
        const Row(children: <Widget>[Icon(Icons.star), Text('1')])
      ]),
      theme.bigSpacing,
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(16)),
      ),
    ]);
  }
}
