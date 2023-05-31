import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/restaurant_card.dart';

class FavRestaurantsView extends StatelessWidget {
  const FavRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RestaurantList();
  }
}

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
      itemBuilder: (BuildContext context, int index) {
        const restaurantId = '28LecpHZyk81KUl6EsND';
        return RestaurantCard(
          name: "Vero Vero",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg",
          deliveryPriceRange: "\$10 - \$15",
          rating: 4.8,
          deliveryTimeRange: "25-35 min",
          typeFood: const ['Pizza', 'Italian'],
          isFavorite: false,
          onTap: () => context.goNamed(RouteName.favoriteRestaurantDetails,
              pathParameters: {'restaurantId': restaurantId}),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 15),
      itemCount: 5,
    );
  }
}
