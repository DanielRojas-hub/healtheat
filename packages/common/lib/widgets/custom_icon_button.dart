import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';

import 'base_card.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      this.onTap,
      required this.iconData,
      this.borderRadius,
      this.iconSize,
      this.backgroundColor,
      this.color,
      this.padding,
      this.elevation,
      this.height,
      this.width})
      : super(key: key);

  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final IconData iconData;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? color;
  final double? elevation;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      height: height,
      width: width,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      borderRadius:
          borderRadius ?? BorderRadius.circular(Constants.radiusSmall),
      onTap: onTap,
      elevation: elevation,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Icon(iconData,
            size: iconSize ?? 20,
            color: color ?? Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
