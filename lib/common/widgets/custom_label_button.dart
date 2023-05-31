import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';

class CustomLabelButton extends StatelessWidget {
  const CustomLabelButton(
      {super.key,
      required this.label,
      this.icon,
      this.backgroundColor,
      this.color,
      this.onTap,
      this.iconColor,
      this.elevation,
      this.iconSize,
      this.borderRadius,
      this.onDeleted,
      this.deleteIconSize,
      this.deleteIconColor,
      this.padding,
      this.expanded,
      this.suffix});

  final Widget label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? elevation;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final VoidCallback? onDeleted;
  final double? deleteIconSize;
  final Color? deleteIconColor;
  final EdgeInsetsGeometry? padding;
  final bool? expanded;
  final IconData? suffix;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      borderRadius:
          borderRadius ?? BorderRadius.circular(Constants.radiusInfinite),
      elevation: elevation ?? 0,
      child: Padding(
        padding: suffix == null
            ? padding ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12)
            : padding ??
                const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: expanded ?? false ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  size: iconSize ?? 16,
                  color: iconColor ??
                      color ??
                      Theme.of(context).colorScheme.onPrimary),
              const SizedBox(width: 5)
            ],
            DefaultTextStyle.merge(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: color ?? Theme.of(context).colorScheme.onPrimary,
                    ),
                child: label),
            if (onDeleted != null) ...[
              const SizedBox(width: 5),
              BaseCard(
                elevation: 0,
                onTap: onDeleted,
                backgroundColor: Colors.transparent,
                borderRadius: BorderRadius.circular(Constants.radiusInfinite),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.cancel,
                      size: deleteIconSize ?? 15, color: deleteIconColor),
                ),
              ),
            ],
            if (suffix != null) ...[
              const SizedBox(width: 5),
              Icon(suffix,
                  size: iconSize ?? 16,
                  color: iconColor ??
                      color ??
                      Theme.of(context).colorScheme.onPrimary),
            ],
          ],
        ),
      ),
    );
  }
}
