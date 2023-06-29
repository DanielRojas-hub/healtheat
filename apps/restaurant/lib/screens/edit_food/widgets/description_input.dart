import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFoodCubit, EditFoodState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (description) =>
              context.read<EditFoodCubit>().descriptionChanged(description),
          maxLines: 4,
          errorText: state.description.displayError != null
              ? 'Invalid description'
              : null,
        );
      },
    );
  }
}
