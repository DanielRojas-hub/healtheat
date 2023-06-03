import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 200;
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return CustomAppBar(
              imageUrl: restaurant.imageUrl, isFavorite: true, height: height);
        }
        if (state is RestaurantLoading) {
          return const CustomAppBar(height: height);
        }
        return const SliverAppBar();
      },
    );
  }
}
