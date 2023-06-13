import 'package:flutter/material.dart';
import 'package:common/widgets/widgets.dart';

import '../payment_method.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key,
      required this.selected,
      required this.paymentMethod,
      required this.label,
      this.onTap});

  final PaymentMethod selected;
  final PaymentMethod paymentMethod;
  final String label;
  final Function(PaymentMethod value)? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      onTap: () => onTap?.call(paymentMethod),
      child: Row(children: [
        const SizedBox(width: 50),
        Text(label),
        const Spacer(),
        Radio(
            value: paymentMethod,
            onChanged: (value) => onTap?.call(value as PaymentMethod),
            groupValue: selected)
      ]),
    );
  }
}
