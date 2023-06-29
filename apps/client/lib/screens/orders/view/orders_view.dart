import 'package:client/router/route_name.dart';
import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../orders.dart';
import '../pages/past_orders/past_orders.dart';
import '../pages/active_orders/active_orders.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key, this.categories, this.cuisines, this.menus})
      : super(key: key);

  final List<String>? categories;
  final List<String>? cuisines;
  final List<String>? menus;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            /*SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(child: SearchAndFilterSection(
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
                      await context.pushNamed(RouteName.homeRestaurantFilter,
                          queryParameters: queryParameters);
                  if (returnedQueryParameters != null) {
                    context.read<RestaurantBloc>().add(
                          UserPreferenceBlocRestaurants(
                              context.read<UserPreferenceBloc>(),
                              categories: returnedQueryParameters['categories']
                                  ?.split(','),
                              cuisines: returnedQueryParameters['cuisines']
                                  ?.split(','),
                              menus:
                                  returnedQueryParameters['menus']?.split(',')),
                        );
                    context.goNamed(RouteName.home,
                        queryParameters: returnedQueryParameters);
                  }
                },
              )),
            ),*/
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            // const SliverPadding(
            //   padding: EdgeInsets.symmetric(horizontal: Constants.margin),
            //   sliver: SliverToBoxAdapter(child: PopularCategoriesTitle()),
            // ),
            // const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
            // const SliverToBoxAdapter(child: PopularCategoryList()),
            // const SliverToBoxAdapter(child: SizedBox(height: 25)),
            const SliverToBoxAdapter(child: HomeTab()),
          ];
        },
        body: PageView(
            onPageChanged: (index) =>
                context.read<TabCubit>().onPageChanged(index),
            controller: context.read<TabCubit>().controller,
            children: const [
              ActiveOrdersPage(),
              PastOrdersPage(),
            ]),
      ),
    );
  }
}
