import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/restaurant_card.dart';

class OpenNowList extends StatelessWidget {
  const OpenNowList({Key? key}) : super(key: key);

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
              return RestaurantCard(
                name: restaurant.displayName.toString(),
                imageUrl: restaurant.imageUrl,
                deliveryPriceRange: restaurant.deliveryPriceRange.toString(),
                rating: restaurant.rating ?? 0,
                deliveryTimeRange: restaurant.deliveryTimeRange.toString(),
                typeFood: const ['Pizza', 'Italian'],
                isFavorite: false,
                onTap: () => context.goNamed(RouteName.homeRestaurantDetails,
                    pathParameters: {'restaurantId': restaurant.id}),
                onTapFavorite: () {},
              );
            },
            itemCount: restaurants.length,
          );
        }
        if (state is RestaurantLoading) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 15),
            itemBuilder: (BuildContext context, int index) =>
                const SkeletonRestaurantCard(),
            itemCount: 3,
          );
        }
        return const SizedBox();
      },
    );
  }
}
