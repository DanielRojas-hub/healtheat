import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';

class HomeRestaurantsView extends StatelessWidget {
  const HomeRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantsLoaded) {
          final restaurants = state.restaurants;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 15),
            itemBuilder: (BuildContext context, int index) {
              final restaurant = restaurants[index];
              return CustomCardRestaurant(
                  name: restaurant.displayName,
                  url:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg",
                  price: "\$10 - \$15",
                  rate: "4,8",
                  time: "25-35 min",
                  typeFood: ['Pizza', 'Italian'],
                  isFavorite: false);
            },
            itemCount: restaurants.length,
          );
        }
        if (state is RestaurantLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
