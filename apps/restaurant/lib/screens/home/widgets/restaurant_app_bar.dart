import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key, this.automaticallyImplyLeading = true});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    const double height = 200;
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return CustomAppBar(
              imageUrl: restaurant.imageUrl,
              isFavorite: true,
              height: height,
              automaticallyImplyLeading: automaticallyImplyLeading);
        }
        if (state is RestaurantLoading) {
          return const CustomAppBar(height: height);
        }
        return const SliverAppBar();
      },
    );
  }
}
