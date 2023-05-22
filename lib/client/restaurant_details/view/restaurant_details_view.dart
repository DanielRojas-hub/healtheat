import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

import '../restaurant_details.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return const [
          RestaurantAppBar(),
          RestaurantInfo(),
        ];
      },
      body: PageView(
          controller: context.read<TabCubit>().controller,
          onPageChanged: (index) =>
              context.read<TabCubit>().onPageChanged(index),
          children: const [MenuPage(), ReviewPage(), AboutPage()]),
    ));
  }
}

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return CustomAppBar(
            image: restaurant.imageUrl,
            isFavorite: true,
            height: 200,
          );
        }
        return const SliverAppBar();
      },
    );
  }
}
