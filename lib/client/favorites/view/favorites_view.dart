import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';
import 'package:healtheat/common/widgets/search_section.dart';
import 'package:healtheat/common/widgets/tab_widget.dart';

import '../favorites.dart';

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
              sliver: SliverToBoxAdapter(child: SearchSection()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(
                child: BlocBuilder<TabCubit, TabState>(
                    builder: (context, state) => TabWidget(
                        onTap: (TabElement selectedTab) =>
                            context.read<TabCubit>().onTap(selectedTab),
                        selectedTab: state.selectedTab,
                        tabList: favoritesTabList)),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
          ];
        },
        body: PageView(
            onPageChanged: (index) =>
                context.read<TabCubit>().onPageChanged(index),
            controller: context.read<TabCubit>().controller,
            children: [
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.margin),
                itemBuilder: (BuildContext context, int index) =>
                    const CustomCardRestaurant(
                        name: "Vero Vero",
                        url:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg",
                        price: "\$10 - \$15",
                        rate: "4,8",
                        time: "25-35 min",
                        typeFood: ['Pizza', 'Italian'],
                        isFavorite: false),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
                itemCount: 5,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.margin),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return CardFood(
                    url:
                        'https://9a3dd0f30ec2813b0355-0aefa298f29a1e32e1203150d51d4825.ssl.cf1.rackcdn.com/pix_5_101918_80061_6293d1fea56d1.jpg',
                    title: const Text('Pizza de cartón'),
                    subtitle: const Text('Gluten free'),
                    price: const Text('\$99,9'),
                    isFavorite: false,
                    onTap: () {},
                    onTapFavorite: () {},
                    onTapPrice: () {},
                  );
                },
                itemCount: 5,
              ),
            ]),
      ),
    );
  }
}
