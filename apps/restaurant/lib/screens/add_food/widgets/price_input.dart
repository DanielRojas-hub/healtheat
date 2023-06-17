import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/add_food/add_food.dart';

class PriceInput extends StatelessWidget {
  const PriceInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      buildWhen: (previous, current) => previous.price != current.price,
      builder: (context, state) {
        return CustomTextField(
          textInputType: TextInputType.number,
          onChanged: (price) =>
              context.read<AddFoodCubit>().priceChanged(price),
          icon: const Icon(
            Icons.attach_money,
            size: 20,
          ),
          errorText: state.price.displayError != null ? 'Invalid price' : null,
        );
      },
    );
  }
}
