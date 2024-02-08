import 'package:flutter/material.dart';

enum PositionIcon {
  suffixIcon,
  prefixIcon;

  static bool isPrefix(PositionIcon position) =>
      position == PositionIcon.prefixIcon;
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.onPressed,
    this.text,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.positionIcon = PositionIcon.prefixIcon,
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.disableBackgroundColor,
    this.disableForegroundColor,
    this.textColor,
    this.border,
    this.mainAxisSize = MainAxisSize.max,
    this.marginTextSuffixIcon,
    this.marginTextPrefixIcon,
    this.child,
    this.style,
  });

  final String? text;
  final VoidCallback onPressed;

  final Widget? icon;
  final Widget? child;

  final bool isLoading;
  final bool isEnabled;
  final PositionIcon positionIcon;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disableBackgroundColor;
  final Color? disableForegroundColor;
  final Color? textColor;
  final MainAxisSize mainAxisSize;
  final RoundedRectangleBorder? border;
  final EdgeInsetsGeometry? marginTextSuffixIcon;
  final EdgeInsetsGeometry? marginTextPrefixIcon;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: isLoading ? null : (isEnabled ? onPressed : null),
      style: style ??
          ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              disabledBackgroundColor:
                  disableBackgroundColor ?? backgroundColor,
              disabledForegroundColor:
                  disableForegroundColor ?? foregroundColor,
              shape: border,
              enableFeedback: true),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: textColor))
          : _contentButton(context));

  Widget _contentButton(BuildContext context) =>
      positionIcon == PositionIcon.prefixIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: mainAxisSize,
              children: <Widget>[
                if (icon != null) ...<Widget>[icon!, const SizedBox(width: 8)],
                if (text != null && text!.isNotEmpty) ...<Widget>[
                  Container(
                      margin: marginTextPrefixIcon,
                      child: Text(text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(height: 1, color: textColor)))
                ],
                if (child != null) ...<Widget>[child!]
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: mainAxisSize,
              children: <Widget>[
                if (text != null && text!.isNotEmpty) ...<Widget>[
                  Container(
                      margin: marginTextSuffixIcon,
                      child: Text(text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(height: 1, color: textColor)))
                ],
                if (icon != null) ...<Widget>[const SizedBox(width: 8), icon!],
                if (child != null) ...<Widget>[child!]
              ],
            );
}
