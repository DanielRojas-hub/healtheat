import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

import '../payment_method.dart';
import 'payment_card.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        /*return const PaymentCard(
          label: '',
          paymentMethod: 
          selected: 
        );*/
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => CustomDivider(
        margin: EdgeInsets.zero,
        color: Colors.grey[100],
      ),
    );
  }
}
