import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_single_icon.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: [
        const CustomSingleIcon(iconData: Icons.delivery_dining),
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
