import 'package:client/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllRestaurantList extends StatelessWidget {
  const AllRestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;
        return BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantsLoaded) {
              final restaurants = state.restaurants;
              return BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoriesLoaded) {
                    final categories = state.categories;

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.margin,
                          vertical: Constants.marginSmall),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (BuildContext context, int index) {
                        final restaurant = restaurants[index];
                        final restaurantCategories = categories
                            .where((element) =>
                                restaurant.categoryIds!.contains(element.id))
                            .toList();
                        final typeFood = List.generate(
                            restaurantCategories.length,
                            (index) => restaurantCategories[index]
                                .displayName
                                .toString());
                        final isFavorite =
                            user.favRestaurants?.contains(restaurant.id);

                        return RestaurantCard(
                          name: restaurant.displayName.toString(),
                          imageUrl: restaurant.imageUrl,
                          deliveryPriceRange:
                              restaurant.deliveryPriceRange.toString(),
                          rating: restaurant.rating ?? 0,
                          deliveryTimeRange:
                              restaurant.deliveryTimeRange.toString(),
                          typeFood: typeFood,
                          isFavorite: isFavorite ?? false,
                          onTap: () => context.goNamed(
                              RouteName.homeRestaurantDetails,
                              pathParameters: {'restaurantId': restaurant.id}),
                          onTapFavorite: () => context
                              .read<UserBloc>()
                              .add(ChangeFavoriteRestaurants(restaurant.id)),
                        );
                      },
                      itemCount: restaurants.length,
                    );
                  }

                  if (state is CategoryLoading) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.margin),
                      physics: const ScrollPhysics(),
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
            if (state is RestaurantLoading) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.margin,
                    vertical: Constants.marginSmall),
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
      },
    );
  }
}
