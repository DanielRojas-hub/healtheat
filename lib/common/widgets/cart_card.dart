import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/counter_widget.dart';

import 'base_card.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isCounter = false,
      required this.suffix,
      this.onIncrease,
      this.onDecrease,
      this.onTap});

  final String title;
  final String subtitle;
  final bool isCounter;
  final String suffix;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      borderRadius: BorderRadius.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(Constants.radiusSmall),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: Theme.of(context).textTheme.titleSmall),
              if (isCounter) ...[
                const SizedBox(height: 5),
                CounterWidget(
                  label: '1',
                  onIncrease: onIncrease,
                  onDecrease: onDecrease,
                )
              ] else ...[
                const SizedBox(height: 3),
                Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
              ]
            ]),
          ),
          const SizedBox(width: 10),
          Text(suffix,
              style: isCounter
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.titleMedium),
          if (isCounter) const SizedBox(width: 10),
        ]),
      ),
    );
  }
}
