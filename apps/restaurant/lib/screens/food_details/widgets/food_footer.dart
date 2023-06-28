import 'package:restaurant/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';

class FoodFooter extends StatelessWidget {
  const FoodFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      if (state is FoodLoaded) {
        final food = state.food;
        return CounterFoodFooter(food: food);
      }
      if (state is FoodLoading) {
        return const CustomFooter(
          title: Text('Total price: '),
          subtitle: Skelton(height: 20),
          buttonChild: Text('Add to cart'),
        );
      }
      return const SizedBox();
    });
  }
}

class CounterFoodFooter extends StatelessWidget {
  const CounterFoodFooter({Key? key, required this.food}) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        final quantity = state;
        final total = (food.price ?? 0) * quantity;
        return CustomFooter(
          title: const Text('Total price: ', maxLines: 1),
          subtitle: Text('\$${stringFix(total)}', maxLines: 1),
          onPressed: () {
            context.read<CartBloc>().add(SetQuantity(
                food.restaurantId, food.id, context.read<CounterBloc>().state));
            context.goNamed(RouteName.home);
          },
          buttonChild: const Text('Add to cart'),
        );
      },
    );
  }
}
