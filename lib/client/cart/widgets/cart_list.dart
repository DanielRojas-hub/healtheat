import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

import 'cart_card.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(children: [
          Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              extentRatio: 0.15,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: Colors.grey[200]!,
                  foregroundColor: Colors.grey[600]!,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: const CartCard(),
          ),
          const CustomDivider()
        ]);
      },
      itemCount: 2,
    );
  }
}
