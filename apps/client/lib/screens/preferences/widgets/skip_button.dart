import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../preferences.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const SizedBox()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: TextButton(
                  onPressed: () async {
                    await context.read<PreferencesCubit>().onSkip();
                    context.pop();
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              );
      },
    );
  }
}
