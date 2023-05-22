import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

import '../restaurant_details.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(slivers: [
      CustomAppBar(
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
        isFavorite: true,
        height: 150,
      ),
      SliverToBoxAdapter(child: RestaurantInfo())
    ]));
  }
}
