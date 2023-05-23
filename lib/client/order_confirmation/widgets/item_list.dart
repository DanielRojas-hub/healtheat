import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/cart_card.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final petitions = state.cart.petitions;

        return BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodsLoaded) {
              final foods = state.foods;

              return ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final petition = petitions[index];
                  final food =
                      foods.firstWhereOrNull((e) => e.id == petition.foodId);

                  return food != null
                      ? CartCard(
                          title: Text(food.displayName.toString()),
                          counter: Text('x${petition.quantity}'),
                          suffix: Text((petition.quantity * (food.price ?? 0))
                              .toString()),
                          imageUrl: food.imageUrl ??
                              'https://as01.epimg.net/meristation/imagenes/2021/04/26/reportajes/1619438192_264857_1619438392_sumario_normal.jpg',
                        )
                      : const SizedBox();
                },
                itemCount: petitions.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const CustomBackgroundWidget(
                        child: CustomDivider(margin: EdgeInsets.zero)),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
