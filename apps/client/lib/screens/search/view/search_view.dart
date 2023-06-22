import 'package:client/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, this.categories, this.cuisines, this.menus});

  final List<String>? categories;
  final List<String>? cuisines;
  final List<String>? menus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantsLoaded) {
          final restaurants = state.restaurants;
          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.margin, vertical: 10),
                  child: SearchAndFilterSection(
                    onTap: () async {
                      Map<String, String>? queryParameters = {};

                      if ((categories ?? []).isNotEmpty) {
                        queryParameters['categories'] = categories!.join(',');
                      }
                      if ((cuisines ?? []).isNotEmpty) {
                        queryParameters['cuisines'] = cuisines!.join(',');
                      }
                      if ((menus ?? []).isNotEmpty) {
                        queryParameters['menus'] = menus!.join(',');
                      }

                      Map<String, String?>? returnedQueryParameters =
                          await context.pushNamed(
                              RouteName.homeRestaurantFilter,
                              queryParameters: queryParameters);
                      if (returnedQueryParameters != null) {
                        context.read<RestaurantBloc>().add(
                              UserPreferenceBlocRestaurants(
                                  context.read<UserPreferenceBloc>(),
                                  categories:
                                      returnedQueryParameters['categories']
                                          ?.split(','),
                                  cuisines: returnedQueryParameters['cuisines']
                                      ?.split(','),
                                  menus: returnedQueryParameters['menus']
                                      ?.split(',')),
                            );
                        context.goNamed(RouteName.search,
                            queryParameters: returnedQueryParameters);
                      }
                    },
                  ),
                ),
                const SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryElements(),
                        CuisineElements(),
                        MenuElements()
                      ],
                    )),
                const SizedBox(height: 20.0),
                ListView.separated(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: Constants.margin),
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final restaurant = restaurants[index];
                    return RestaurantCard(
                      name: restaurant.displayName.toString(),
                      imageUrl: restaurant.imageUrl,
                      deliveryPriceRange:
                          restaurant.deliveryPriceRange.toString(),
                      deliveryTimeRange:
                          restaurant.deliveryTimeRange.toString(),
                      rating: 5,
                      typeFood: const ['Sushi', 'European'],
                      onTap: () => context.goNamed(
                          RouteName.searchRestaurantDetails,
                          pathParameters: {'restaurantId': restaurant.id}),
                      isFavorite: true,
                    );
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 20),
                )
              ],
            ),
          );
        }
        if (state is RestaurantLoading) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.margin, vertical: Constants.marginSmall),
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
