import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';

class HomeOpenView extends StatelessWidget {
  const HomeOpenView({super.key});

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
                name: restaurant.displayName.toString(),
                imageUrl: restaurant.imageUrl,
                price: restaurant.deliveryPriceRange.toString(),
                rate: restaurant.rating.toString(),
                time: restaurant.deliveryTimeRange.toString(),
                typeFood: const ['Pizza', 'Italian'],
                isFavorite: false,
                onTap: () => context.goNamed(RouteName.homeRestaurantDetails,
                    pathParameters: {'restaurantId': restaurant.id}),
              );
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
