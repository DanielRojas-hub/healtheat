import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/favorites/pages/fav_dishes/fav_dishes.dart';
import 'package:healtheat/client/favorites/pages/fav_restaurants/fav_restaurants.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/search_section.dart';
import 'package:healtheat/common/widgets/custom_tab.dart';

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
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(
                  child: SearchAndFilterSection(
                      goRouteName: RouteName.favoriteRestaurantFilter)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(
              child: BlocBuilder<TabCubit, TabState>(
                  builder: (context, state) => CustomTabNav(
                      onTap: (TabElement selectedTab) =>
                          context.read<TabCubit>().onTap(selectedTab),
                      tabList: state.tabList,
                      selectedIndex: state.selectedIndex)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
          ];
        },
        body: PageView(
            onPageChanged: (index) =>
                context.read<TabCubit>().onPageChanged(index),
            controller: context.read<TabCubit>().controller,
            children: const [
              FavRestaurantsPage(),
              FavDishesPage(),
            ]),
      ),
    );
  }
}
