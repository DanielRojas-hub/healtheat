import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:healtheat/common/widgets/cart_card.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            extentRatio: 0.3,
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
          child: const CartCard(
            title: 'Sakura Set',
            subtitle: 'x1',
            suffix: '\$23.69',
            isCounter: true,
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        );
      },
      itemCount: 2,
    );
  }
}
