import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../../../../../shared/assets/images/image.path.dart';
import '../../../../../shared/widgets/buttons/primary.button.widget.dart';
import '../cubit/home.timeline.cubit.dart';

class HomeTimelineEmptyStateWidget extends StatefulWidget {
  const HomeTimelineEmptyStateWidget({super.key});

  @override
  State<HomeTimelineEmptyStateWidget> createState() =>
      _HomeTimelineEmptyStateWidgetState();
}

class _HomeTimelineEmptyStateWidgetState
    extends State<HomeTimelineEmptyStateWidget> {
  late HomeTimelineCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<HomeTimelineCubit>();

    return Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Image.asset(ImagePath.logo, height: 148, width: 148),
              theme.bigerSpacingHorizontal,
              Text('Opsss! Nenhum restaurante encontrado',
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center),
              theme.bigerSpacingHorizontal,
              PrimaryButtonWidget(
                  text: 'Tentar novamente',
                  icon: const Icon(Icons.settings_outlined, size: 16),
                  onPressed: () async {
                    cubit.searchController.clear();

                    await cubit.getListRestaurant();
                  })
            ])));
  }
}
