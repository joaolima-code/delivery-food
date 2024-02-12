import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../../../../../shared/widgets/image/image.network.widget.dart';
import '../cubit/home.restaurant.detail.cubit.dart';

class HomeRestaurantDetailInfoWidget extends StatefulWidget {
  const HomeRestaurantDetailInfoWidget({super.key});

  @override
  State<HomeRestaurantDetailInfoWidget> createState() =>
      _HomeRestaurantDetailInfoWidgetState();
}

class _HomeRestaurantDetailInfoWidgetState
    extends State<HomeRestaurantDetailInfoWidget> {
  late HomeRestaurantDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<HomeRestaurantDetailCubit>();

    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
                radius: 25,
                child: ClipOval(
                    child: ImageNetworkWidget(
                        urlImage: cubit.restaurantEntity.logoPhoto,
                        width: 50,
                        height: 50))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: theme.dividerHorizontal(20)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(cubit.restaurantEntity.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(cubit.restaurantEntity.typeFood,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(height: 1)),
                  Text(cubit.restaurantEntity.phone,
                      style: Theme.of(context).textTheme.bodySmall)
                ]),
          ],
        ),
        Row(children: <Widget>[
          const Icon(Icons.star),
          Text('${cubit.restaurantEntity.review}')
        ])
      ]),
      theme.bigSpacing,
      Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade100, width: 5),
              borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
              height: 196,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: cubit.restaurantEntity.locale, zoom: 16),
                  zoomControlsEnabled: false,
                  onMapCreated: cubit.onMapCreated,
                  markers: cubit.markers)))
    ]);
  }
}
