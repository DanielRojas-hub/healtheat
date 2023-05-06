import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton(
      {Key? key,
      this.onTap,
      required this.iconData,
      this.iconSize,
      this.padding,
      this.elevation,
      this.borderRadius,
      this.color})
      : super(key: key);

  final VoidCallback? onTap;
  final Color? color;
  final IconData iconData;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      elevation: elevation ?? 0,
      borderRadius:
          borderRadius ?? BorderRadius.circular(Constants.radiusInfinite),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(5.0),
        child: Icon(iconData, size: iconSize ?? 16.0, color: color),
      ),
    );
  }
}
