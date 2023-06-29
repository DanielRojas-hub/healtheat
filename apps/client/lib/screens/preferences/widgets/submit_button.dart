import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../preferences.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: state.isValid
                    ? () async {
                        await context
                            .read<PreferencesCubit>()
                            .onSubmit(context.read<UserBloc>().state.user);
                        context.pop();
                      }
                    : null,
                child: const Text("Continue"));
      },
    );
  }
}
