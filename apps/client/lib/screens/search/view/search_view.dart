import 'package:client/router/route_name.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.margin, vertical: 10),
          child: SearchAndFilterSection(
            onTap: () => context.goNamed(RouteName.searchRestaurantFilter),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              final isFirst = index == 0;

              return Padding(
                padding: EdgeInsets.only(left: !isFirst ? 8.0 : 0),
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
            const restaurantId = '28LecpHZyk81KUl6EsND';
            return RestaurantCard(
              name: "Hoshi-Sushi",
              imageUrl:
                  'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
              deliveryPriceRange: '\$15 - \$20',
              deliveryTimeRange: '30-40 min',
              rating: 4.5,
              typeFood: const ['Sushi', 'European'],
              onTap: () => context.goNamed(RouteName.searchRestaurantDetails,
                  pathParameters: {'restaurantId': restaurantId}),
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
