import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 200;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;
        return BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoaded) {
              final restaurant = state.restaurant;
              final isFavorite = user.favRestaurants?.contains(restaurant.id);
              return CustomAppBar(
                imageUrl: restaurant.imageUrl,
                isFavorite: isFavorite ?? false,
                height: height,
                onTapFavorite: () => context
                    .read<UserBloc>()
                    .add(ChangeFavoriteRestaurants(restaurant.id)),
              );
            }
            if (state is RestaurantLoading) {
              return const CustomAppBar(height: height);
            }
            return const SliverAppBar();
          },
        );
      },
    );
  }
}
