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
      this.width,
      this.iconColor,
      this.elevation,
      this.iconSize,
      this.borderRadius,
      this.onDeleted,
      this.deleteIconSize,
      this.deleteIconColor,
      this.padding});

  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color;
  final double? width;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? elevation;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final VoidCallback? onDeleted;
  final double? deleteIconSize;
  final Color? deleteIconColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      borderRadius:
          borderRadius ?? BorderRadius.circular(Constants.radiusInfinite),
      width: width,
      elevation: elevation ?? 0,
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  size: iconSize ?? 16,
                  color: iconColor ??
                      color ??
                      Theme.of(context).colorScheme.onPrimary),
              const SizedBox(width: 5)
            ],
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color ?? Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            if (onDeleted != null) ...[
              const SizedBox(width: 5),
              BaseCard(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onTap: onDeleted,
                borderRadius: BorderRadius.circular(Constants.radiusInfinite),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.cancel,
                      size: deleteIconSize ?? 15, color: deleteIconColor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
