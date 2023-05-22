import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';

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
              return CardFood(
                url: food.imageUrl,
                title: Text(food.displayName),
                subtitle: const Text('Gluten free'),
                price: Text(food.price.toString()),
                isFavorite: false,
                onTap: () {},
                onTapFavorite: () {},
                onTapPrice: () {},
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