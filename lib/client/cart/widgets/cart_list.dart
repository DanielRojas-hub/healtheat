import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/widgets/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        const restaurantId = '28LecpHZyk81KUl6EsND';
        const foodId = 'qqewld4omDi4w4qF9hPl';

        return Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => context
                    .read<CartBloc>()
                    .add(const RemovePetition(restaurantId, foodId)),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
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
            onTap: () => context.goNamed(RouteName.cartFoodDetails),
            onIncrease: () => context
                .read<CartBloc>()
                .add(const IncreaseQuantity(restaurantId, foodId)),
            onDecrease: () => context
                .read<CartBloc>()
                .add(const DecreaseQuantity(restaurantId, foodId)),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(margin: EdgeInsets.zero),
      itemCount: 2,
    );
  }
}
