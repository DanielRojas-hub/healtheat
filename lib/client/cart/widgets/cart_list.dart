import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/cards/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

import '../cart.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final status = state.status;
        if (status == CartStatus.notEmpty) {
          final petitions = state.cart.petitions;
          return BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodsLoaded) {
                final foods = state.foods;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final petition = petitions[index];
                    final food =
                        foods.firstWhereOrNull((e) => e.id == petition.foodId);
                    if (food != null) {
                      return SlidableCartCard(
                        food: food,
                        petition: petition,
                        child: CartCard(
                          title: Text(food.displayName.toString()),
                          counter: Text(petition.quantity.toString()),
                          suffix: Text(
                              '\$${petition.quantity * (food.price ?? 0)}'),
                          isCounter: true,
                          onTap: () => context.pushNamed(
                              RouteName.cartRestaurantFoodDetails,
                              pathParameters: {
                                'restaurantId': food.restaurantId,
                                'foodId': food.id
                              }),
                          onIncrease: () => context
                              .read<CartBloc>()
                              .add(IncreaseQuantity(food.id)),
                          onDecrease: petition.quantity - 1 > 0
                              ? () => context
                                  .read<CartBloc>()
                                  .add(DecreaseQuantity(food.id))
                              : null,
                          imageUrl: food.imageUrl,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const CustomDivider(margin: EdgeInsets.zero),
                  itemCount: petitions.length,
                );
              }
              if (state is FoodLoading) {
                return cartLoadingWidget();
              }
              return const SizedBox();
            },
          );
        }
        return cartLoadingWidget();
      },
    );
  }

  Widget cartLoadingWidget() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => const SkeletonCartCard(isCounter: true),
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(margin: EdgeInsets.zero),
      itemCount: 3,
    );
  }
}
