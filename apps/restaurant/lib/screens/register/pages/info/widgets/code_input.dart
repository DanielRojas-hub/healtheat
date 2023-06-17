import 'package:common/widgets/custom_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';

class CodeInput extends StatelessWidget {
  const CodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.code != current.code,
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<RegisterCubit>().codeController,
          prefixText: "+",
          readOnly: true,
          onTap: () => showCountryPicker(
            favorite: <String>['VE'],
            context: context,
            onSelect: (Country value) {
              context.read<RegisterCubit>().codeChanged(value.phoneCode);
            },
          ),
          onChanged: (code) =>
              {context.read<RegisterCubit>().codeChanged(code)},
          errorText: state.code.displayError != null ? 'Invalid' : null,
        );
      },
    );
  }
}
