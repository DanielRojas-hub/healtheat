import 'package:client/router/route_name.dart';
import 'package:common/services/search/search_bloc.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurants'),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SearchWidget(),
        SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [CategoryElements(), CuisineElements(), MenuElements()],
            )),
        SizedBox(height: 20.0),
        SearchList()
      ]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.margin, vertical: 10),
          child: SearchAndFilterSection(
            onChanged: (value) =>
                context.read<SearchBloc>().add(InputChange(value)),
            onTapSearch: () {},
            onTapFilter: () async {
              Map<String, String>? queryParameters = {};

              if ((state.categoryIds ?? []).isNotEmpty) {
                queryParameters['categoryIds'] = state.categoryIds!.join(',');
              }
              if ((state.cuisineIds ?? []).isNotEmpty) {
                queryParameters['cuisineIds'] = state.cuisineIds!.join(',');
              }
              if ((state.menuIds ?? []).isNotEmpty) {
                queryParameters['menuIds'] = state.menuIds!.join(',');
              }

              Map<String, String?>? returnedQueryParameters =
                  await context.pushNamed(RouteName.searchRestaurantFilter,
                      queryParameters: queryParameters);
              if (returnedQueryParameters != null) {
                context.read<SearchBloc>().add(
                      FilterChange(
                          categoryIds: returnedQueryParameters['categoryIds']
                              ?.split(','),
                          cuisineIds:
                              returnedQueryParameters['cuisineIds']?.split(','),
                          menuIds:
                              returnedQueryParameters['menuIds']?.split(',')),
                    );
                context.goNamed(RouteName.search,
                    queryParameters: returnedQueryParameters);
              }
            },
          ),
        );
      },
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;

        return BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantsLoaded) {
              return BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoriesLoaded) {
                    final categories = state.categories;
                    return BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        final restaurants = state.restaurants;
                        if ((restaurants ?? []).isNotEmpty) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Constants.margin),
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final restaurant = restaurants[index];
                              final isFavorite = user.favRestaurants?.contains(restaurant.id);

                              final restaurantCategories = categories
                                  .where((element) =>
                                      restaurant.categoryIds!.contains(element.id))
                                  .toList();
                              final typeFood = List.generate(
                                  restaurantCategories.length,
                                  (index) => restaurantCategories[index]
                                      .displayName
                                      .toString());

                              return RestaurantCard(
                                name: restaurant.displayName.toString(),
                                imageUrl: restaurant.imageUrl,
                                deliveryPriceRange:
                                    restaurant.deliveryPriceRange.toString(),
                                deliveryTimeRange:
                              '${DateFormat('HH:mm').format(DateTime.parse(restaurant.openTime!))} - ${DateFormat('HH:mm').format(DateTime.parse(restaurant.closeTime!))}',
                                rating: 5,
                                typeFood: typeFood,
                                onTap: () => context.goNamed(
                                    RouteName.searchRestaurantDetails,
                                    pathParameters: {
                                      'restaurantId': restaurant.id
                                    }),
                                isFavorite: isFavorite?? false,
                                onTapFavorite: () => context
                              .read<UserBloc>()
                              .add(ChangeFavoriteRestaurants(restaurant.id)),
                              );
                            },
                            itemCount: restaurants!.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                const SizedBox(height: 20),
                          );
                        }

                        return const Center(
                          child: Text('No hay resultados'),
                        );
                      },
                    );
                  }

                  if (state is CategoryLoading) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding:
                          const EdgeInsets.symmetric(horizontal: Constants.margin),
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
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
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
    );
  }
}
