import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';

class ButtonStars extends StatelessWidget {
  const ButtonStars({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(5, (index) {
      final bool isActive = index + 1 <= rating;
      return Icon(isActive ? Icons.star : Icons.star_border_rounded,
          color: isActive
              ? context.theme.rateColor
              : Theme.of(context).disabledColor);
    }));
  }
}
