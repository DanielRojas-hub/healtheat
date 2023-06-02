// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:healtheat/client/food_details/widgets/food_info.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/counter/counter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';
import 'package:healtheat/common/widgets/custom_footer.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    Key? key,
    required this.restaurantId,
    required this.foodId,
  }) : super(key: key);

  final String restaurantId;
  final String foodId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: FoodFooter(),
        body: CustomScrollView(
          slivers: [
            FoodAppBar(),
            FoodInformation(),
          ],
        ));
  }
}

class FoodFooter extends StatelessWidget {
  const FoodFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        final quantity = state;
        return BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodLoaded) {
              final food = state.food;
              final total = (food.price ?? 0) * quantity;
              return CustomFooter(
                price: Text('\$$total'),
                label: const Text('Total price: '),
                onPressed: () {
                  context.read<CartBloc>().add(SetQuantity(food.restaurantId,
                      food.id, context.read<CounterBloc>().state));
                  context.goNamed(RouteName.cart);
                },
                textButton: const Text('Add to cart'),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class FoodInformation extends StatelessWidget {
  const FoodInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;

          return SliverToBoxAdapter(
            child: FoodInfo(
                title: Text(food.displayName.toString()),
                price: Text(food.price.toString()),
                subtitle: Text(food.description.toString())),
          );
        }
        if (state is FoodLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;

          return CustomAppBar(
              isFavorite: true,
              imageUrl: food.imageUrl ??
                  'https://as01.epimg.net/meristation/imagenes/2021/04/26/reportajes/1619438192_264857_1619438392_sumario_normal.jpg',
              height: 275);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
