import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const CartCard(
            title: 'Sakura Set', subtitle: 'x1', suffix: '\$23.69');
      },
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) =>
          CustomDivider(color: Colors.grey[100], height: 1),
    );
  }
}
