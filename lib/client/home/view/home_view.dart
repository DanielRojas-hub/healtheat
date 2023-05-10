import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/category_button.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';
import 'package:healtheat/common/widgets/custom_section_text.dart';
import 'package:healtheat/common/widgets/tab_widget.dart';
import 'package:healtheat/common/widgets/view_all_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular categories",
                    style: Theme.of(context).textTheme.titleLarge),
                const ViewAllButton(iconData: Icons.keyboard_arrow_right),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: List.generate(25, (index) {
          //       final isFirst = index == 0;
          //       return Padding(
          //         padding:
          //             EdgeInsets.only(left: isFirst ? 15.0 : 0, right: 20.0),
          //         child: const CategoryButton(
          //           iconData: Icons.lunch_dining,
          //           label: Text("BURGER"),
          //         ),
          //       );
          //     }),
          //   ),
          // ),
          const SizedBox(height: 15),
          BlocBuilder<TabCubit, TabState>(
            builder: (context, state) {
              return TabWidget(
                onTap: (TabElement selectedTab) =>
                    context.read<TabCubit>().onTap(selectedTab),
                selectedTab: state.selectedTab,
                tabList: homeTabList,
              );
            },
          ),
          PageView(
              controller: context.read<TabCubit>().controller,
              onPageChanged: (int index) =>
                  context.read<TabCubit>().onPageChanged(index),
              children: [
                Container(color: Colors.green),
                Container(color: Colors.red),
              ]),

          /* PageView(
            controller: context.read<TabCubit>().controller,
            onPageChanged: (int index) =>
                context.read<TabCubit>().onPageChanged(index),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const CustomCardRestaurant(
                      name: "name",
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg",
                      price: "price",
                      rate: "rate",
                      time: "time",
                      typeFood: [],
                      isFavorite: false);
                },
                itemCount: 5,
              ),
              Container(
                color: Colors.green,
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
