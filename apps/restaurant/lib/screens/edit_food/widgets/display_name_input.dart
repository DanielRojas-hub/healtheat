import 'package:common/common.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';

class DisplayNameInput extends StatelessWidget {
  const DisplayNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFoodCubit, EditFoodState>(
      builder: (context, state) {
        return CustomTextField(
          onChanged: (displayName) =>
              context.read<EditFoodCubit>().nameChanged(displayName),
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
