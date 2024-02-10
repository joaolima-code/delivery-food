import 'package:flutter/material.dart';

import '../../../../core/theme/core.theme.style.dart';
import '../../../../shared/widgets/forms/form.input.widget.dart';
import 'home.timeline.card.widget.dart';

class HomeTimelineMainContentWidget extends StatefulWidget {
  const HomeTimelineMainContentWidget({super.key});

  @override
  State<HomeTimelineMainContentWidget> createState() =>
      _HomeTimelineMainContentWidgetState();
}

class _HomeTimelineMainContentWidgetState
    extends State<HomeTimelineMainContentWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormInputWidget(
                  hintText: 'Pesquisar',
                  textEditingController: TextEditingController(),
                  prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.search)),
                  textInputType: TextInputType.text),
              theme.spacing,
              Text('Restaurantes', style: theme.textTheme.titleLarge),
              theme.smallSpacing,
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const HomeTimelineCardWidget();
                  })
            ]));
  }
}
