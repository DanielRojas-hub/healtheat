import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:healtheat/common/widgets/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              icon: Icons.delete,
            ),
          ],
        ),
        child: CartCard(
          title: 'Sakura Set',
          subtitle: 'x1',
          suffix: '\$23.69',
          isCounter: true,
          onTap: () {},
          onIncrease: () {},
        ),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(margin: EdgeInsets.zero),
      itemCount: 2,
    );
  }
}
