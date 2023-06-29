import 'package:common/controllers/controllers.dart';
import 'package:common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../restaurant_details.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView(
      {Key? key, required this.restaurantId, required this.foodRouteName})
      : super(key: key);

  final String restaurantId;
  final String foodRouteName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const RestaurantAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: RestaurantDisplayName()),
          ),
          // const SliverToBoxAdapter(child: SizedBox(height: 10)),
          // const SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: Constants.margin),
          //   sliver: SliverToBoxAdapter(child: RestaurantSpecifications()),
          // ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const SliverToBoxAdapter(child: RestaurantDetailsTab())
        ];
      },
      body: PageView(
          controller: context.read<TabCubit>().controller,
          onPageChanged: (index) =>
              context.read<TabCubit>().onPageChanged(index),
          children: [
            MenuPage(restaurantId: restaurantId, foodRouteName: foodRouteName),
            // const ReviewPage(),
            AboutPage(restaurantId: restaurantId)
          ]),
    ));
  }
}
