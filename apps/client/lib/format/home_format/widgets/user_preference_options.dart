import 'package:client/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserPreferenceOptions extends StatelessWidget {
  const UserPreferenceOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferenceBloc, UserPreferenceState>(
      builder: (context, state) {
        if (state is UserPreferenceLoaded) {
          final userPreference = state.userPreference;
          return CustomLabelButton(
            label: Text(userPreference.displayName.toString()),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            suffix: Icons.keyboard_arrow_down,
            onTap: () => context.goNamed(RouteName.menuPreferencesHome),
          );
        }
        if (state is UserPreferenceLoading) {
          return CustomLabelButton(
            label: const Text('No Preference Activated'),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            suffix: Icons.keyboard_arrow_down,
            onTap: () => context.goNamed(RouteName.menuPreferencesHome),
          );
        }
        return const SizedBox();
      },
    );
  }
}
