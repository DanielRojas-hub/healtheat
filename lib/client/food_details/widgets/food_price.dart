import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/string_fix.dart';
import 'package:healtheat/common/widgets/skelton.dart';

class FoodPrice extends StatelessWidget {
  const FoodPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;
          return Text('\$${stringFix(food.price)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ));
        }
        if (state is FoodLoading) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Skelton(height: 20, width: 100),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
