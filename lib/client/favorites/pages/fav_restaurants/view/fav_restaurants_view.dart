import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';

class FavRestaurantsView extends StatelessWidget {
  const FavRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantList();
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
      itemBuilder: (BuildContext context, int index) => const CustomCardRestaurant(
          name: "Vero Vero",
          url:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg",
          price: "\$10 - \$15",
          rate: "4,8",
          time: "25-35 min",
          typeFood: ['Pizza', 'Italian'],
          isFavorite: false),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 15),
      itemCount: 5,
    );
  }
}