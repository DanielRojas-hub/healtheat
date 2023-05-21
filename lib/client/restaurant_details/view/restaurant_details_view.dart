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
        image:
            'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
        isFavorite: true,
        height: 150,
      ),
      SliverToBoxAdapter(
          child: RestaurantInfo(
        name: "Vero Vero",
        price: "\$10 - \$15",
        rate: "4,8",
        time: "25-35 min",
      ))
    ]));
  }
}
