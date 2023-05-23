import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {Key? key,
      this.onTap,
      required this.child,
      this.borderRadius,
      this.elevation,
      this.width,
      this.backgroundColor,
      this.height,
      this.border})
      : super(key: key);

  final double? elevation;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double? width;
  final Widget child;
  final double? height;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final originalBorderRadius = BorderRadius.circular(Constants.radiusMedium);
    final originalColorCard = Theme.of(context).cardColor;

    return Material(
      elevation: elevation ?? 2,
      color: backgroundColor ?? originalColorCard,
      shape: /* border != null
          ? null
          : */
          RoundedRectangleBorder(
              borderRadius: borderRadius ?? originalBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? originalBorderRadius,
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: border,
            borderRadius: /* border != null ? null : */ borderRadius ??
                originalBorderRadius,
            color: backgroundColor ?? originalColorCard,
          ),
          child: child,
        ),
      ),
    );
  }
}
