import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/food_card.dart';

class DishesList extends StatelessWidget {
  const DishesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          final foods = state.foods;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.margin, vertical: Constants.marginSmall),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              final food = foods[index];
              return FoodCard(
                imageUrl: food.imageUrl,
                title: food.displayName.toString(),
                categories: const ['Gluten free'],
                price: food.price ?? 0,
                isFavorite: false,
                onTap: () => onPushFoodDetails(context, food),
                onTapFavorite: () {},
                onTapPrice: () => onPushFoodDetails(context, food),
              );
            },
            itemCount: foods.length,
          );
        }
        if (state is FoodLoading) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.margin, vertical: Constants.marginSmall),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) =>
                const SkeletonFoodCard(),
            itemCount: 5,
          );
        }
        return const SizedBox();
      },
    );
  }

  void onPushFoodDetails(BuildContext context, Food food) => context.pushNamed(
      RouteName.favoriteRestaurantFoodDetails,
      pathParameters: {'restaurantId': food.restaurantId, 'foodId': food.id});
}
