import 'package:flutter/material.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../../../../../core/util/core.navigator.util.dart';
import '../../../../../shared/widgets/image/image.network.widget.dart';
import '../../../domain/entity/home.simpleRestaurant.entity.dart';
import '../../detail/home.restaurant.detail.args.dart';
import '../../detail/home.restaurant.detail.module.dart';

class HomeTimelineCardWidget extends StatelessWidget {
  const HomeTimelineCardWidget({
    required this.restaurantEntity,
    super.key,
  });

  final HomeSimpleRestaurantEntity restaurantEntity;

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
                route: HomeRestaurantDetailModule.route,
                arguments: HomeRestaurantDetailArgs(
                    idRestaurant: restaurantEntity.id,
                    nameRestaurant: restaurantEntity.name)),
            child: Stack(children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: ImageNetworkWidget(
                            urlImage: restaurantEntity.backgroundPhoto,
                            boxFit: BoxFit.fitWidth,
                            boxConstraints:
                                const BoxConstraints(maxHeight: 180))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Row(children: <Widget>[
                              CircleAvatar(
                                  radius: 25,
                                  child: ClipOval(
                                      child: ImageNetworkWidget(
                                          urlImage: restaurantEntity.logoPhoto,
                                          width: 50,
                                          height: 50))),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: theme.dividerHorizontal(20)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(restaurantEntity.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Text(restaurantEntity.typeFood,
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
