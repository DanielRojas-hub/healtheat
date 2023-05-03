import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Constants.radiusSmall)),
          child: Icon(Icons.delivery_dining,
              size: 20, color: Theme.of(context).colorScheme.onPrimary),
        ),
        const SizedBox(width: 10),
        Expanded(
          child:
              Text('Delivery', style: Theme.of(context).textTheme.titleSmall),
        ),
        const SizedBox(width: 10),
        Text('\$0.00', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(width: 10),
      ]),
    );
  }
}
