import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:restaurant/screens/register/cubit/register/register_cubit.dart';

class ClosingTimeInput extends StatelessWidget {
  const ClosingTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.closingTime != current.closingTime,
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<RegisterCubit>().closingTimeController,
          readOnly: true,
          prefixText: 'Closing time',
          icon: const Icon(Icons.schedule, size: 20),
          onTap: () async {
            final Map<String, String> queryParameters = {
              'type': 'close',
            };
            if (state.closingTime.value.isNotEmpty) {
              queryParameters['initTime'] = state.closingTime.value;
            }
            final time = await context.pushNamed(RouteName.timePicker,
                queryParameters: queryParameters) as DateTime?;
            context.read<RegisterCubit>().closingTimeChanged(time);
          },
          errorText: state.closingTime.displayError != null
              ? 'Invalid schedule'
              : null,
        );
      },
    );
  }
}
