import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDisplayName extends StatelessWidget {
  const FoodDisplayName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;
          return Text(food.displayName.toString(),
              style: Theme.of(context).textTheme.headlineSmall);
        }
        if (state is FoodLoading) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Skelton(width: 200),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
