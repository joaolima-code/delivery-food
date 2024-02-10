import 'package:flutter/material.dart';

import '../../../../core/theme/core.theme.style.dart';
import '../../../../core/util/core.navigator.util.dart';
import '../../../../shared/widgets/image/image.network.widget.dart';
import '../../../restaurant/detail/restaurant.detail.args.dart';
import '../../../restaurant/detail/restaurant.detail.module.dart';

class HomeTimelineCardWidget extends StatelessWidget {
  const HomeTimelineCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: theme.cardColor,
        elevation: 1,
        child: InkWell(
            radius: 16,
            onTap: () => CoreNavigatorUtil.instance.startPage(
                context: context,
                route: RestaurantDetailModule.route,
                arguments: RestaurantDetailArgs(idRestaurant: 1)),
            child: Stack(children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        child: ImageNetworkWidget(
                            urlImage:
                                'https://www.gastronomia.com.br/wp-content/uploads/2023/07/comida-brasileira-10-pratos-tipicos-famosos-do-brasil.jpg',
                            boxFit: BoxFit.fitWidth,
                            boxConstraints: BoxConstraints(maxHeight: 180))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Row(children: <Widget>[
                              const CircleAvatar(
                                  radius: 25,
                                  child: ClipOval(
                                      child: ImageNetworkWidget(
                                          urlImage:
                                              'https://blog.agenciadosite.com.br/wp-content/uploads/2017/01/logo-gallus.jpg',
                                          width: 50,
                                          height: 50))),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: theme.dividerHorizontal(20)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Restaurante Gallus',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Text('Comida brasileira',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(height: 1))
                                  ])
                            ])))
                  ])
            ])));
  }
}
