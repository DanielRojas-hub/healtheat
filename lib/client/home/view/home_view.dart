import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/category_button.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';
import 'package:healtheat/common/widgets/search_section.dart';
import 'package:healtheat/common/widgets/tab_widget.dart';
import 'package:healtheat/common/widgets/view_all_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(child: SearchSection()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
              sliver: SliverToBoxAdapter(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text("Popular Categories",
                        style: Theme.of(context).textTheme.titleLarge),
                    const ViewAllButton(),
                  ])),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(25, (index) {
                      final isFirst = index == 0;
                      return Padding(
                        padding: EdgeInsets.only(
                            left: isFirst ? Constants.margin : 0, right: 15.0),
                        child: CategoryButton(
                          iconData: Icons.lunch_dining_outlined,
                          label: Text("Burger",
                              style: Theme.of(context).textTheme.labelSmall),
                          onTap: () {},
                        ),
                      );
                    }),
                  )),
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
                        tabList: homeTabList)),
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
            ]),
      ),
    );
  }
}
