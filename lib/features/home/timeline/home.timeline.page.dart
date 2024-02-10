import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/home.drawer.widget.dart';
import 'cubit/home.timeline.cubit.dart';
import 'widgets/home.timeline.appBar.widget.dart';
import 'widgets/home.timeline.mainContent.widget.dart';

class HomeTimelinePage extends StatefulWidget {
  const HomeTimelinePage({super.key});

  @override
  State<HomeTimelinePage> createState() => _HomeTimelinePageState();
}

class _HomeTimelinePageState extends State<HomeTimelinePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        drawer: const HomeDrawerWidget(),
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.96),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(62),
            child: HomeTimelineAppBarWidget()),
        body: BlocListener<HomeTimelineCubit, HomeTimelineState>(
            listener: (BuildContext context, HomeTimelineState state) {
              // TODO: implement listener
            },
            child: const HomeTimelineMainContentWidget()));
  }
}
