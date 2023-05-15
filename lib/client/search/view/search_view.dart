import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_card_restaurant.dart';
import 'package:healtheat/common/widgets/custom_chip.dart';

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
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  final isFirst = index == 0;

                  return Padding(
                    padding: EdgeInsets.only(left: !isFirst ? 8.0 : 10.0),
                    child: const CustomChip(label: 'Sushi'),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20.0),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomCardRestaurant(
                  name: "Hoshi-Sushi",
                  url:
                      'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
                  price: '\$15 - \$20',
                  time: '30-40 min',
                  rate: '4.5',
                  typeFood: const ['Sushi', 'European'],
                  onTap: () {},
                  isFavorite: true,
                );
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
            )
          ],
        ));
  }
}
