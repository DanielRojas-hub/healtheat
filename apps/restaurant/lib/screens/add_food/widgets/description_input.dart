import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/add_food/add_food.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (description) =>
              context.read<AddFoodCubit>().descriptionChanged(description),
          maxLines: 4,
          errorText: state.description.displayError != null
              ? 'Invalid description'
              : null,
        );
      },
    );
  }
}
