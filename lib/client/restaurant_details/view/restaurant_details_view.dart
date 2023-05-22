// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

import '../restaurant_details.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({
    Key? key,
    required this.restaurantId,
    required this.foodName,
  }) : super(key: key);

  final String restaurantId;

  final String foodName;

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
          children: [
            MenuPage(restaurantId: restaurantId, foodName: foodName),
            const ReviewPage(),
            const AboutPage()
          ]),
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
            imageUrl: restaurant.imageUrl ??
                'https://as01.epimg.net/meristation/imagenes/2021/04/26/reportajes/1619438192_264857_1619438392_sumario_normal.jpg',
            isFavorite: true,
            height: 200,
          );
        }
        return const SliverAppBar();
      },
    );
  }
}
