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
    return const Scaffold(
      bottomNavigationBar: FoodFooter(),
      body: CustomScrollView(
        slivers: [
          FoodAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodDisplayName()),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 5.0)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodPrice()),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            sliver: SliverToBoxAdapter(child: FoodDescription()),
          ),
          SliverFillRemaining(child: FoodCounter())
        ],
      ),
    );
  }
}
