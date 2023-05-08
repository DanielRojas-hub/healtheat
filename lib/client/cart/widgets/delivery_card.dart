import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Row(children: [
        const CustomIconButton(iconData: Icons.delivery_dining, elevation: 0),
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
