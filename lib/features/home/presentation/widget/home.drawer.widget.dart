import 'package:flutter/material.dart';

import '../../../../core/bdLocal/domain/usecase/core.clear.usecase.dart';
import '../../../../core/bdLocal/domain/usecase/core.get.username.usecase.dart';
import '../../../../core/core.config.dart';
import '../../../../core/theme/core.theme.style.dart';
import '../../../../core/util/core.navigator.util.dart';
import '../../../auth/presentation/initial/auth.initial.module.dart';

class HomeDrawerWidget extends StatefulWidget {
  const HomeDrawerWidget({super.key});

  @override
  State<HomeDrawerWidget> createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  late String? username;

  final CoreGetUsernameUsecase usernameUsecase =
      CoreConfig.injector<CoreGetUsernameUsecase>();
  final CoreClearUsecase clearUsecase = CoreConfig.injector<CoreClearUsecase>();

  @override
  void initState() {
    initName();
    super.initState();
  }

  Future<void> initName() async {
    username = await usernameUsecase.call(null);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Drawer(
        backgroundColor: theme.colorScheme.onPrimary,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.9)),
                  child: SizedBox(
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Bem vindo!',
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.onPrimary),
                          ),
                          Row(children: <Widget>[
                            SizedBox(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        theme.colorScheme.onPrimary,
                                    child: const ClipOval(
                                        child: Icon(Icons.person_outline)))),
                            theme.spacingHorizontal,
                            Flexible(
                                flex: 2,
                                child: Text(username ?? '',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(
                                            color: theme.colorScheme.onPrimary),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1))
                          ]),
                        ],
                      ))),
              Column(children: <Widget>[
                buildListTile(theme, icon: Icons.logout, title: 'Sair',
                    onTap: () async {
                  await clearUsecase.call(null);

                  if (mounted) {
                    CoreNavigatorUtil.instance.startPageWithNewBackStack(
                        context: context, route: AuthInitialModule.route);
                  }
                })
              ])
            ]));
  }

  ListTile buildListTile(ThemeData theme,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
        leading: Icon(icon, color: theme.colorScheme.secondary),
        title: Text(title, style: theme.textTheme.titleMedium),
        onTap: onTap);
  }
}
