import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 275;
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;
          return CustomAppBar(
              isFavorite: true, imageUrl: food.imageUrl, height: height);
        }
        if (state is FoodLoading) {
          return const CustomAppBar(height: height);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
