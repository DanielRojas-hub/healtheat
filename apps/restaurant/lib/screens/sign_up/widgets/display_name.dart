import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sign_up.dart';

class DisplayNameInput extends StatelessWidget {
  const DisplayNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.displayName != current.displayName,
      builder: (context, state) {
        return TextField(
          onChanged: (displayName) =>
              context.read<RegisterCubit>().displayNameChanged(displayName),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Full Name",
            suffixIcon: const Icon(Icons.person),
            errorText: state.email.displayError != null ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}
