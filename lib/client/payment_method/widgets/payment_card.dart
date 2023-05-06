import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      child: Row(children: [
        const SizedBox(width: 50),
        const Text('Apple Pay'),
        const Spacer(),
        Radio(value: true, onChanged: (value) {}, groupValue: true)
      ]),
    );
  }
}
