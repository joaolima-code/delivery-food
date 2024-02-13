import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/core.theme.style.dart';
import '../../../../../shared/widgets/forms/form.input.widget.dart';
import '../cubit/home.timeline.cubit.dart';
import 'home.timeline.card.widget.dart';
import 'home.timeline.emptyState.widget.dart';

class HomeTimelineMainContentWidget extends StatefulWidget {
  const HomeTimelineMainContentWidget({super.key});

  @override
  State<HomeTimelineMainContentWidget> createState() =>
      _HomeTimelineMainContentWidgetState();
}

class _HomeTimelineMainContentWidgetState
    extends State<HomeTimelineMainContentWidget> {
  late HomeTimelineCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    cubit = context.watch<HomeTimelineCubit>();

    return BlocBuilder<HomeTimelineCubit, HomeTimelineState>(
      builder: (BuildContext context, HomeTimelineState state) {
        return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormInputWidget(
                      hintText: 'Pesquisar',
                      textEditingController: cubit.searchController,
                      prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.search)),
                      suffixIcon: state is Loading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: CircularProgressIndicator())
                          : null,
                      textInputType: TextInputType.text),
                  theme.spacing,
                  if (cubit.listRestaurant.isNotEmpty) ...<Widget>[
                    Text('Restaurantes', style: theme.textTheme.titleLarge),
                    theme.smallSpacing,
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.listRestaurant.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeTimelineCardWidget(
                              restaurantEntity: cubit.listRestaurant[index]);
                        })
                  ] else if (state is Loading) ...<Widget>[
                    const Center(child: CircularProgressIndicator())
                  ] else ...<Widget>[
                    const HomeTimelineEmptyStateWidget()
                  ]
                ]));
      },
    );
  }
}
