import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/card_food.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

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
      const FoodList(),
      const SizedBox(height: 20)
    ]);
  }
}

class FoodList extends StatelessWidget {
  const FoodList({
    super.key,
  });

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
                url: food.imageUrl,
                title: Text(food.displayName),
                subtitle: const Text('Gluten free'),
                price: Text(food.price.toString()),
                isFavorite: false,
                onTap: () {},
                onTapFavorite: () {},
                onTapPrice: () {},
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
