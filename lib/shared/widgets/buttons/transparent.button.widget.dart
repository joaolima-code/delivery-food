import 'package:flutter/material.dart';

import 'button.widget.dart';

class TransparentButtonWidget extends StatelessWidget {
  const TransparentButtonWidget({
    required this.text,
    required this.onPressed,
    this.width,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
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
            backgroundColor: Colors.transparent,
            textColor: isEnabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary));
  }
}
