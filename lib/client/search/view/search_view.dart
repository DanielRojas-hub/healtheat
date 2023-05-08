import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';
import 'package:healtheat/common/widgets/custom_search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(),
    //     body: ListView(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         children: [
    //           ListView.separated(
    //             shrinkWrap: true,
    //             physics: const ScrollPhysics(),
    //             itemBuilder: (context, index) {
    //               return CustomCardRestaurant(
    //                 name: "Hoshi-Sushi",
    //                 url:
    //                     'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
    //                 price: '\$15 - \$20',
    //                 time: '30-40 min',
    //                 rate: '4.5',
    //                 typeFood: const ['Sushi', 'European'],
    //                 onTap: () {},
    //                 isFavorite: true,
    //               );
    //             },
    //             itemCount: 10,
    //             separatorBuilder: (BuildContext context, int index) {
    //               return const SizedBox(height: 20);
    //             },
    //           )
    //         ]));
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(),
        ));
  }
}
