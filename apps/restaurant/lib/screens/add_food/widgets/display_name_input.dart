import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/add_food/add_food.dart';

class DisplayNameInput extends StatelessWidget {
  const DisplayNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      buildWhen: (previous, current) =>
          previous.displayName != current.displayName,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (displayName) =>
              context.read<AddFoodCubit>().nameChanged(displayName),
          icon: const Icon(
            Icons.fastfood,
            size: 20,
          ),
          errorText:
              state.displayName.displayError != null ? 'Invalid name' : null,
        );
      },
    );
  }
}
