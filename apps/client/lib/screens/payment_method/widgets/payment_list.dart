import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
        return const PaymentCard();
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => CustomDivider(
        margin: EdgeInsets.zero,
        color: Colors.grey[100],
      ),
    );
  }
}
