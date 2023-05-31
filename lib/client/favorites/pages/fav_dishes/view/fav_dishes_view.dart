import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/food_card.dart';

class FavDishesView extends StatelessWidget {
  const FavDishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          final foods = state.foods;

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              final food = foods[index];
              return FoodCard(
                imageUrl: food.imageUrl,
                title: Text(food.displayName.toString()),
                subtitle: const Text('Gluten free'),
                price: Text(food.price.toString()),
                isFavorite: false,
                onTap: () => context.pushNamed(
                    RouteName.favoriteRestaurantFoodDetails,
                    pathParameters: {
                      'restaurantId': food.restaurantId,
                      'foodId': food.id
                    }),
                onTapFavorite: () {},
                onTapPrice: () => context.pushNamed(
                    RouteName.favoriteRestaurantFoodDetails,
                    pathParameters: {
                      'restaurantId': food.restaurantId,
                      'foodId': food.id
                    }),
              );
            },
            itemCount: foods.length,
          );
        }
        if (state is FoodLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
