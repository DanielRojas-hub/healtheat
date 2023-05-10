import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class SectionText extends StatelessWidget {
  const SectionText({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  final Widget label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: BorderRadius.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DefaultTextStyle.merge(
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
          child: label,
        ),
      ),
    );
  }
}
