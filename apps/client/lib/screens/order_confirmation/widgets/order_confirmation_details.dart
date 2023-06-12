import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OrderConfirmationDetails extends StatelessWidget {
  const OrderConfirmationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discount:', style: Theme.of(context).textTheme.titleSmall),
            Text('\$0.00', style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery:', style: Theme.of(context).textTheme.titleSmall),
            Text('\$0.00', style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ]),
    );
  }
}