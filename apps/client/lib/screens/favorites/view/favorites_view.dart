import 'package:client/router/route_name.dart';
import 'package:common/controllers/controllers.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../favorites.dart';
import '../pages/pages.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

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
                onTap: () =>
                    context.goNamed(RouteName.favoriteRestaurantFilter),
              )),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            const SliverToBoxAdapter(child: FavoritesTab()),
          ];
        },
        body: PageView(
            onPageChanged: (index) =>
                context.read<TabCubit>().onPageChanged(index),
            controller: context.read<TabCubit>().controller,
            children: const [
              RestaurantsPage(),
              DishesPage(),
            ]),
      ),
    );
  }
}
