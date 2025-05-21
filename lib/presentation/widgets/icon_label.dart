import 'package:flutter/material.dart';
import 'package:portfolio_flutter/presentation/configs/configs.dart';
import 'package:portfolio_flutter/presentation/utils/extensions/extensions.dart';

/// A simple icon + label row (no animations)
class IconLabel extends StatelessWidget {
  /// Leading icon
  final IconData icon;

  /// Text label next to the icon
  final String label;

  /// (Unused) color parameter retained for compatibility
  final Color coverColor;

  /// Optional custom text style
  final TextStyle? textStyle;

  const IconLabel({
    Key? key,
    required this.icon,
    required this.label,
    required this.coverColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: context.adaptive(s18, s24),
        ),
        horizontalSpaceMassive,
        Text(
          label,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
