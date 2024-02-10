import 'package:flutter/material.dart';

class HomeTimelineAppBarWidget extends StatefulWidget {
  const HomeTimelineAppBarWidget({super.key});

  @override
  State<HomeTimelineAppBarWidget> createState() =>
      _HomeTimelineAppBarWidgetState();
}

class _HomeTimelineAppBarWidgetState extends State<HomeTimelineAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
        leading: IconButton(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
            icon: const Icon(Icons.menu_rounded, size: 24),
            onPressed: () async {
              // await cubit.updateUserInfo();
              // if (context.mounted) {
              //   DragBottomSheetDialogWidget.showBottomSheet(
              //       context: context,
              //       isScrollControlled: true,
              //       builder: (BuildContext context) =>
              //           HomeInitialBottomSheetWidget(
              //               isAuthenticated: cubit.isAuthenticated,
              //               userInfo: cubit.sessionModel?.userInfo));
              // }
            }),
        actions: <Widget>[
          Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.6),
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ola fred, voce está nesse endereço',
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                    Text('Rua amazonas, 123',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.onSurface,
                            height: 1.2,
                            fontWeight: FontWeight.w400))
                  ]))
        ]);
  }
}
