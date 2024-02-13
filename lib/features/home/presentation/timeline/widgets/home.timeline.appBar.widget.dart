import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home.timeline.cubit.dart';

class HomeTimelineAppBarWidget extends StatefulWidget {
  const HomeTimelineAppBarWidget({super.key});

  @override
  State<HomeTimelineAppBarWidget> createState() =>
      _HomeTimelineAppBarWidgetState();
}

class _HomeTimelineAppBarWidgetState extends State<HomeTimelineAppBarWidget> {
  late HomeTimelineCubit _cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _cubit = context.watch<HomeTimelineCubit>();

    return AppBar(
        leading: IconButton(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            icon: const Icon(Icons.menu_rounded, size: 24),
            onPressed: () async {
              Scaffold.of(context).openDrawer();
            }),
        actions: <Widget>[
          Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.8),
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Buscando restaurantes perto de:',
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                    if (_cubit.address != null)
                      Text(_cubit.address!,
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSurface,
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400))
                  ]))
        ]);
  }
}
