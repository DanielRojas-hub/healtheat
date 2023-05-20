import 'package:flutter/material.dart';
import 'package:healtheat/client/food_details/widgets/food_info.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomAppBar(
            isFavorite: false,
            image:
                "https://s1.eestatic.com/2021/05/27/como/584453709_186431572_1706x960.jpg",
            height: 200),
        SliverToBoxAdapter(child: FoodInfo()),
      ],
    ));
  }
}
