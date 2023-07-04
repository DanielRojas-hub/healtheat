import 'package:common/controllers/controllers.dart';
import 'package:common/services/user/user_bloc.dart';
import 'package:common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';

import '../pages/pages.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
    required this.restaurantId,
  });

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Aqui va el logout
          },
          child: const Icon(Icons.logout),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const RestaurantAppBar(automaticallyImplyLeading: false),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                sliver: SliverToBoxAdapter(child: RestaurantDisplayName()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                sliver: SliverToBoxAdapter(child: RestaurantSpecifications()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 30)),
              const SliverToBoxAdapter(child: RestaurantDetailsTab())
            ];
          },
          body: PageView(
              controller: context.read<TabCubit>().controller,
              onPageChanged: (index) =>
                  context.read<TabCubit>().onPageChanged(index),
              children: [
                MenuPage(restaurantId: restaurantId),
                // const ReviewPage(),
                AboutPage(
                  restaurantId: restaurantId,
                )
              ]),
        ));
  }
}
