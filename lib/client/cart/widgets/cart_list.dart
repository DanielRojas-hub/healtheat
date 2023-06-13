import 'package:cart_repository/cart_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/string_fix.dart';
import 'package:healtheat/common/widgets/cards/cart_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final status = state.status;
        if (status == CartStatus.notEmpty) {
          final petitions = state.cart.petitions;
          return FoodCartList(petitions: petitions);
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => const SkeletonCartCard(),
          separatorBuilder: (BuildContext context, int index) =>
              const CustomDivider(margin: EdgeInsets.zero),
          itemCount: 3,
        );
      },
    );
  }
}

class FoodCartList extends StatelessWidget {
  const FoodCartList({Key? key, required this.petitions}) : super(key: key);

  final List<Petition> petitions;

  @override
  Widget build(BuildContext context) {
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
                  foods.firstWhereOrNull((food) => food.id == petition.foodId);
              if (food != null) {
                final total = petition.quantity * (food.price ?? 0);
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => context
                            .read<CartBloc>()
                            .add(RemovePetition(food.id)),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: CartCard(
                    title: food.displayName.toString(),
                    counter: petition.quantity.toString(),
                    suffix: '\$${stringFix(total)}',
                    onIncrease: () =>
                        context.read<CartBloc>().add(IncreaseQuantity(food.id)),
                    onDecrease: () =>
                        context.read<CartBloc>().add(DecreaseQuantity(food.id)),
                    onTap: () => context.pushNamed(
                        RouteName.cartRestaurantFoodDetails,
                        pathParameters: {
                          'restaurantId': food.restaurantId,
                          'foodId': food.id
                        }),
                    imageUrl: food.imageUrl,
                    isCounter: true,
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
          return ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => const SkeletonCartCard(),
            separatorBuilder: (BuildContext context, int index) =>
                const CustomDivider(margin: EdgeInsets.zero),
            itemCount: 3,
          );
        }
        return const SizedBox();
      },
    );
  }
}
