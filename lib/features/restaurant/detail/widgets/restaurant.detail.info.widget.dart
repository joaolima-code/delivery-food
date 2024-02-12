import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/theme/core.theme.style.dart';
import '../../../../shared/widgets/image/image.network.widget.dart';
import '../cubit/restaurant.detail.cubit.dart';

class RestaurantDetailInfoWidget extends StatefulWidget {
  const RestaurantDetailInfoWidget({super.key});

  @override
  State<RestaurantDetailInfoWidget> createState() =>
      _RestaurantDetailInfoWidgetState();
}

class _RestaurantDetailInfoWidgetState
    extends State<RestaurantDetailInfoWidget> {
  late RestaurantDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<RestaurantDetailCubit>();

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
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade100, width: 5),
              borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
              height: 196,
              child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(-18.910758, -48.317527), zoom: 16),
                  zoomControlsEnabled: false,
                  onMapCreated: cubit.onMapCreated,
                  markers: cubit.markers)))
    ]);
  }
}
