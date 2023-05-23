import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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

                  return food != null
                      ? Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            extentRatio: 0.3,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) => context
                                    .read<CartBloc>()
                                    .add(RemovePetition(food.id)),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                foregroundColor: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: CartCard(
                            title: Text(food.displayName.toString()),
                            counter: Text(petition.quantity.toString()),
                            suffix: Text((petition.quantity * (food.price ?? 0))
                                .toString()),
                            isCounter: true,
                            onTap: () => context.pushNamed(
                                RouteName.cartRestaurantFoodDetails,
                                pathParameters: {
                                  'restaurantId': food.restaurantId,
                                  'foodId': food.id
                                }),
                            onIncrease: () => context.read<CartBloc>().add(
                                  IncreaseQuantity(food.id),
                                ),
                            onDecrease: petition.quantity - 1 > 0
                                ? () => context.read<CartBloc>().add(
                                      DecreaseQuantity(food.id),
                                    )
                                : null,
                            imageUrl: food.imageUrl ??
                                'https://as01.epimg.net/meristation/imagenes/2021/04/26/reportajes/1619438192_264857_1619438392_sumario_normal.jpg',
                          ),
                        )
                      : const SizedBox();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const CustomDivider(margin: EdgeInsets.zero),
                itemCount: petitions.length,
              );
            }
            if (state is FoodLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
