import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';

class CustomLabelButton extends StatelessWidget {
  const CustomLabelButton(
      {super.key,
      required this.title,
      this.icon,
      this.backgroundColor,
      this.color,
      this.onTap,
      this.width,
      this.iconColor,
      this.elevation,
      this.iconSize});

  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color;
  final double? width;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? elevation;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(Constants.radiusInfinite),
      width: width,
      elevation: elevation ?? 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
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
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color ?? Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
