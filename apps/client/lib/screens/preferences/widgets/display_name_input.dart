import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preferences.dart';

class DisplayNameInput extends StatelessWidget {
  const DisplayNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return TextField(
          onChanged: (displayName) =>
              context.read<PreferencesCubit>().displayNameChanged(displayName),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.tune),
            errorText:
                state.displayName.displayError != null ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}
