import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';

class FoodButtons extends StatelessWidget {
  FoodButtons({super.key});
  final FoodRepository foodRepository = FoodRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;
          return ElevatedButton(
            onPressed: () {
              foodRepository.deleteFood(food.restaurantId, food.id);
              context.goNamed(RouteName.home,
                  pathParameters: {'restaurantId': food.restaurantId});
            },
            child: const Text("Delete food"),
          );
        }
        return const SizedBox();
      },
    );
  }
}
