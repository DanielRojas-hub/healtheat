import 'package:client/router/route_name.dart';
import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../home.dart';
import '../pages/open_now/open_now.dart';
import '../pages/all_restaurants/all_restaurants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, this.categoryIds, this.cuisineIds, this.menuIds})
      : super(key: key);

  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(
                child: SearchAndFilterSection(
                  readOnly: true,
                  onTapSearch: () => context.goNamed(RouteName.search),
                  onTapFilter: () async {
                    Map<String, String>? queryParameters = {};

                    if ((categoryIds ?? []).isNotEmpty) {
                      queryParameters['categoryIds'] = categoryIds!.join(',');
                    }
                    if ((cuisineIds ?? []).isNotEmpty) {
                      queryParameters['cuisineIds'] = cuisineIds!.join(',');
                    }
                    if ((menuIds ?? []).isNotEmpty) {
                      queryParameters['menuIds'] = menuIds!.join(',');
                    }

                    Map<String, String?>? returnedQueryParameters =
                        await context.pushNamed(RouteName.homeRestaurantFilter,
                            queryParameters: queryParameters);
                    if (returnedQueryParameters != null) {
                      context.read<RestaurantBloc>().add(
                            UserPreferenceBlocRestaurants(
                                context.read<UserPreferenceBloc>(),
                                categoryIds:
                                    returnedQueryParameters['categoryIds']
                                        ?.split(','),
                                cuisineIds:
                                    returnedQueryParameters['cuisineIds']
                                        ?.split(','),
                                menuIds: returnedQueryParameters['menuIds']
                                    ?.split(',')),
                          );
                      context.goNamed(RouteName.home,
                          queryParameters: returnedQueryParameters);
                    }
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(child: PopularCategoriesTitle()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
            const SliverToBoxAdapter(child: PopularCategoryList()),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            const SliverToBoxAdapter(child: HomeTab()),
          ];
        },
        body: PageView(
            onPageChanged: (index) =>
                context.read<TabCubit>().onPageChanged(index),
            controller: context.read<TabCubit>().controller,
            children: const [
              AllRestaurantsPage(),
              OpenNowPage(),
            ]),
      ),
    );
  }
}
