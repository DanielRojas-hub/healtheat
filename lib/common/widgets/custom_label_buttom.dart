import 'package:flutter/material.dart';

class CustomLabelButtom extends StatelessWidget {
  const CustomLabelButtom(
      {super.key,
      required this.title,
      this.icon,
      this.backgroundColor,
      this.color,
      this.onTap});

  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onTap; /* Las distintas funciones de los botones */

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Ink(
          decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon,
                      size: 16,
                      color: color ?? Theme.of(context).colorScheme.onPrimary),
                  const SizedBox(width: 5)
                ],
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: color ?? Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          )),
    );
  }
}
