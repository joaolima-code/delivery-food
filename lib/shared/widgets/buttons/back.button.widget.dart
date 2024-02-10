import 'package:flutter/material.dart';

import '../../../core/util/core.navigator.util.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    this.onPressed,
    this.color,
    super.key,
  });

  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed != null
            ? () {
                onPressed!();
                CoreNavigatorUtil.instance.pop(context);
              }
            : () => CoreNavigatorUtil.instance.pop(context),
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: color));
  }
}
