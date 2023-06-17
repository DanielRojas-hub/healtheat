import 'package:cart_repository/cart_repository.dart';
import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final status = state.status;
        if (status == CartStatus.notEmpty) {
          final petitions = state.cart.petitions;
          return FoodCartTotal(petitions: petitions);
        }
        if (status == CartStatus.loading) {
          return const SkeletonTotalCard();
        }
        return const SizedBox();
      },
    );
  }
}

class FoodCartTotal extends StatelessWidget {
  const FoodCartTotal({Key? key, required this.petitions}) : super(key: key);

  final List<Petition> petitions;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          final foods = state.foods;
          final total = calculateTotal(foods, petitions);
          return TotalCard(label: Text('\$$total'));
        }
        if (state is FoodLoading) {
          return const SkeletonTotalCard();
        }
        return const SizedBox();
      },
    );
  }

  num calculateTotal(List<Food> foods, List<Petition> petitions) {
    num sum = 0;
    for (int i = 0; i < foods.length; i++) {
      final food = foods[i];
      for (int j = 0; j < petitions.length; j++) {
        final petition = petitions[j];
        if (food.id == petition.foodId) {
          sum += (food.price ?? 0) * petition.quantity;
        }
      }
    }
    return sum;
  }
}
