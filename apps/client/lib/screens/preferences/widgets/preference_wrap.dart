import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preferences.dart';

class PreferenceWrap extends StatelessWidget {
  const PreferenceWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        final selectedPreferences = state.foodPreferences;
        return BlocBuilder<FoodPreferenceBloc, FoodPreferenceState>(
          builder: (context, state) {
            if (state is FoodPreferencesLoaded) {
              final foodPreferences = state.foodPreferences;
              return Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(foodPreferences.length, (index) {
                    final foodPreference = foodPreferences[index];
                    final isSelected =
                        selectedPreferences.contains(foodPreference);

                    return CustomLabelButton(
                      label: Text(foodPreference.displayName),
                      backgroundColor: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.secondaryContainer,
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                      onTap: () => isSelected
                          ? context
                              .read<PreferencesCubit>()
                              .removePreference(foodPreference)
                          : context
                              .read<PreferencesCubit>()
                              .insertPreference(foodPreference),
                    );
                  }));
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
