import 'package:common/utils/utils.dart';
import 'package:flutter/material.dart';

import '../food_detail.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails(
      {Key? key, required this.restaurantId, required this.foodId})
      : super(key: key);

  final String restaurantId;
  final String foodId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const FoodAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodDisplayName()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodPrice()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodDescription()),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            sliver: SliverToBoxAdapter(child: FoodButtons()),
          ),
        ],
      ),
    );
  }
}
