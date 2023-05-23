import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/client/preferences_filter/cubit/select_preferences_cubit.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/preference/preference_bloc.dart';
import 'package:healtheat/common/services/user_preference/user_preference_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/base_card.dart';
import 'package:healtheat/common/widgets/image_container.dart';
import 'package:preference_repository/preference_repository.dart';

class PreferencesFilterView extends StatelessWidget {
  const PreferencesFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const PreferenceAppBar()),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        children: [
          const SizedBox(height: 20),
          Text('Select your preferences',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 15),
          Text(
              'Healthheat will need your preferences to show you information that is relevant to you.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 25),
          const PreferenceList(),
          const SizedBox(height: 25),
        ],
      )),
    );
  }
}

class PreferenceAppBar extends StatelessWidget {
  const PreferenceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPreferencesCubit, List<Preference>>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseCard(
              onTap: () => context.goNamed(RouteName.home),
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Text('Skip',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).disabledColor,
                        decoration: TextDecoration.underline)),
              ),
            ),
            BaseCard(
              onTap: state.isNotEmpty
                  ? () {
                      context
                          .read<UserPreferenceBloc>()
                          .add(UpdateUserPreference(state));
                      context.goNamed(RouteName.home);
                    }
                  : null,
              backgroundColor: state.isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.tertiaryContainer,
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Text(
                  'Confirm',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: state.isNotEmpty
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onTertiaryContainer),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class PreferenceList extends StatelessWidget {
  const PreferenceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPreferencesCubit, List<Preference>>(
      builder: (context, state) {
        final selectedPreferences = state;

        return BlocBuilder<PreferenceBloc, PreferenceState>(
          builder: (context, state) {
            if (state is PreferencesLoaded) {
              final preferences = state.preferences;

              return ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final preference = preferences[index];
                    final isSelected = selectedPreferences.contains(preference);

                    return OptionPreference(
                        title: Text(preference.displayName),
                        subtitle: Text(preference.description),
                        isSelected: isSelected,
                        preference: preference);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: preferences.length);
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class OptionPreference extends StatelessWidget {
  const OptionPreference(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isSelected,
      required this.preference});

  final Widget title;
  final Widget subtitle;
  final bool isSelected;
  final Preference preference;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () => isSelected
          ? context.read<SelectPreferencesCubit>().removePreference(preference)
          : context.read<SelectPreferencesCubit>().insertPreference(preference),
      border: isSelected
          ? Border.all(color: Theme.of(context).primaryColor, width: 2)
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(children: [
          const ImageContainer(
              url: 'https://cdn-icons-png.flaticon.com/512/3637/3637808.png',
              height: 45,
              width: 45,
              isCircle: true),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:
                          isSelected ? Theme.of(context).primaryColor : null),
                  child: title),
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.labelMedium,
                  child: subtitle),
            ],
          ))
        ]),
      ),
    );
  }
}
