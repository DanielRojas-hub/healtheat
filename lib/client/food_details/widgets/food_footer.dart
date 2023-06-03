import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/counter/counter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/string_fix.dart';
import 'package:healtheat/common/widgets/custom_footer.dart';
import 'package:healtheat/common/widgets/skelton.dart';

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
            context.goNamed(RouteName.cart);
          },
          buttonChild: const Text('Add to cart'),
        );
      },
    );
  }
}
