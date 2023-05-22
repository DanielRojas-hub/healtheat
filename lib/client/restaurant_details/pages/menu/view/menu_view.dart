// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    Key? key,
    required this.foodName,
  }) : super(key: key);

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(top: 15.0), children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(50, (index) {
            final isFirst = index == 0;
            final isLast = index + 1 == 50;

            return Padding(
              padding: EdgeInsets.only(
                  left: isFirst ? Constants.margin : 8,
                  right: isLast ? Constants.margin : 0),
              child: CustomLabelButton(
                  label: Text('Sushi',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer)),
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer),
            );
          }),
        ),
      ),
      const SizedBox(height: 20.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular', style: Theme.of(context).textTheme.titleMedium),
            CustomIconButton(
                iconData: Icons.grid_view_outlined,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                color: Theme.of(context).colorScheme.onSecondaryContainer)
          ],
        ),
      ),
      const SizedBox(height: 10.0),
      GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
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
            onTap: () => context.goNamed(foodName),
            onTapFavorite: () {},
            onTapPrice: () {},
          );
        },
        itemCount: 10,
      ),
      const SizedBox(height: 20)
    ]);
  }
}
