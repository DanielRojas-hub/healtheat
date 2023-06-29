import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';

class PrevisualizationView extends StatelessWidget {
  const PrevisualizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFoodCubit, EditFoodState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.image != null ? Image.file(state.image!) : const SizedBox(),
            const SizedBox(height: 15.0),
            Text(
              state.displayName.value.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              '\$${state.price.value.toString()}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 10.0),
            Text(
              state.description.value.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        );
      },
    );
  }
}
