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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (state.user.isNotEmpty) ...[
              const IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.transparent,
                ),
                onPressed: null,
              ),
            ] else ...[
              TextButton(
                onPressed: null,
                child: Text(
                  'Log in',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.transparent,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
            BlocBuilder<UserPreferenceBloc, UserPreferenceState>(
              builder: (context, state) {
                if (state is UserPreferenceLoaded) {
                  final userPreference = state.userPreference;
                  return CustomLabelButton(
                    label: Text(userPreference.displayName.toString()),
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    suffix: Icons.keyboard_arrow_down,
                    onTap: () => context.goNamed(RouteName.menuPreferencesHome),
                  );
                }
                if (state is UserPreferenceLoading) {
                  return CustomLabelButton(
                    label: const Text('No Preference Activated'),
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    suffix: Icons.keyboard_arrow_down,
                    onTap: () => context.goNamed(RouteName.menuPreferencesHome),
                  );
                }
                return const SizedBox();
              },
            ),
            if (state.user.isNotEmpty) ...[
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => context
                    .read<AuthenticationBloc>()
                    .add(const AppLogoutRequested()),
              ),
            ] else ...[
              TextButton(
                onPressed: () => context.pushNamed(RouteName.loginHome,
                    extra: RouteName.registerHome),
                child: Text('Log in',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ],
        );
      },
    );
  }
}
