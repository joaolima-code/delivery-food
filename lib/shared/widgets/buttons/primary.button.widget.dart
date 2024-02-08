import 'package:flutter/material.dart';

import 'button.widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    required this.text,
    required this.onPressed,
    this.width,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.disableColor,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final Color? disableColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ButtonWidget(
        icon: icon,
        text: text,
        onPressed: onPressed,
        isLoading: isLoading,
        isEnabled: isEnabled,
        positionIcon: PositionIcon.suffixIcon,
        backgroundColor: Theme.of(context).colorScheme.primary,
        disableBackgroundColor: disableColor,
        textColor: isEnabled
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
