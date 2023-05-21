import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
import 'package:healtheat/common/widgets/custom_chip.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(5, (index) {
            final isFirst = index == 0;

            return Padding(
              padding: EdgeInsets.only(left: !isFirst ? 8.0 : 0),
              child: const CustomLabelButton(label: Text('Sushi')),
            );
          }),
        ),
      ),
      const SizedBox(height: 20.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular', style: Theme.of(context).textTheme.titleMedium),
            CustomIconButton(
                iconData: Icons.grid_view_rounded,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                color: Theme.of(context).colorScheme.onSecondaryContainer)
          ],
        ),
      ),
      const SizedBox(height: 20.0),
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
            onTap: () {},
            onTapFavorite: () {},
            onTapPrice: () {},
          );
        },
        itemCount: 10,
      ),
    ]);
  }
}
