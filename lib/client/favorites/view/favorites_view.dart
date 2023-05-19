import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
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

/*  */
