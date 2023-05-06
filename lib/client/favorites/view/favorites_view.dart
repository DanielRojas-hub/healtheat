import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
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
                title: 'Pizza de cartón',
                subtitle: 'Gluten free',
                price: '\$99,9',
                isFavorite: false,
                onTap: () {},
                onTapFavorite: () {},
                onTapPrice: () {},
              );
            },
            itemCount: 45,
          ),
        ],
      ),
    );
  }
}
