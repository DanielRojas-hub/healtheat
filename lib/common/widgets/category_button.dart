import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'custom_icon_button.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.iconData,
    required this.label,
    this.iconSize,
    this.padding,
    this.color,
    this.backgroundColor,
    this.elevation,
    required this.onTap,
    this.borderRadius,
  }) : super(key: key);

  final IconData iconData;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          iconData: iconData,
          backgroundColor: backgroundColor ?? Colors.grey[100],
          color: color ?? Colors.grey[600],
          iconSize: iconSize ?? 30,
          padding: padding ?? const EdgeInsets.all(10.0),
          elevation: elevation ?? 0,
          onTap: onTap,
          borderRadius:
              borderRadius ?? BorderRadius.circular(Constants.radiusSmall),
        ),
        DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.labelSmall, child: label),
      ],
    );
  }
}
