// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    Key? key,
    required this.restaurantId,
    required this.foodName,
  }) : super(key: key);

  final String restaurantId;

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(top: 15.0), children: [
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      // child: Row(
      //   children: List.generate(50, (index) {
      //     final isFirst = index == 0;
      //     final isLast = index + 1 == 50;

      //     return Padding(
      //       padding: EdgeInsets.only(
      //           left: isFirst ? Constants.margin : 8,
      //           right: isLast ? Constants.margin : 0),
      //       child: CustomLabelButton(
      //           label: Text('Sushi',
      //               style: Theme.of(context).textTheme.labelMedium?.copyWith(
      //                   color: Theme.of(context)
      //                       .colorScheme
      //                       .onTertiaryContainer)),
      //           backgroundColor:
      //               Theme.of(context).colorScheme.tertiaryContainer),
      //     );
      //   }),
      // ),
      // ),
      // const SizedBox(height: 20.0),
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
      FoodList(restaurantId: restaurantId, foodName: foodName),
      const SizedBox(height: 20)
    ]);
  }
}

class FoodList extends StatelessWidget {
  const FoodList({
    Key? key,
    required this.restaurantId,
    required this.foodName,
  }) : super(key: key);

  final String restaurantId;

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          final foods = state.foods;

          return GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              final food = foods[index];

              return CardFood(
                url: food.imageUrl ??
                    'https://as01.epimg.net/meristation/imagenes/2021/04/26/reportajes/1619438192_264857_1619438392_sumario_normal.jpg',
                title: Text(food.displayName.toString()),
                subtitle: const Text('Gluten free'),
                price: Text(food.price.toString()),
                isFavorite: false,
                onTap: () => context.goNamed(foodName, pathParameters: {
                  'restaurantId': restaurantId,
                  'foodId': food.id
                }),
                onTapFavorite: () {},
                onTapPrice: () => context.goNamed(foodName, pathParameters: {
                  'restaurantId': restaurantId,
                  'foodId': food.id
                }),
              );
            },
            itemCount: foods.length,
          );
        }

        if (state is FoodLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
