import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 275;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;
        return BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodLoaded) {
              final food = state.food;
              final isFavorite = user.favFoods?.contains(food.id);
              return CustomAppBar(
                isFavorite: isFavorite ?? false,
                imageUrl: food.imageUrl,
                height: height,
                onTapFavorite: () =>
                    context.read<UserBloc>().add(ChangeFavoriteDishes(food.id)),
              );
            }
            if (state is FoodLoading) {
              return const CustomAppBar(height: height);
            }
            return const SliverToBoxAdapter();
          },
        );
      },
    );
  }
}
