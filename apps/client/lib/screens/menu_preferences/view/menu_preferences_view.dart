import 'package:client/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/constants.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenuPreferencesView extends StatelessWidget {
  const MenuPreferencesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 7.0),
          const HorizontalScrollBar(),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: BaseCard(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onTap: () {
                context.pop();
                context.goNamed(RouteName.preferencesHome, extra: false);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Add preference',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          const UserPreferenceList(),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class UserPreferenceList extends StatelessWidget {
  const UserPreferenceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferenceBloc, UserPreferenceState>(
      builder: (context, state) {
        if (state is UserPreferencesLoaded) {
          final userPreferences = state.userPreferences;
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final userPreference = userPreferences[index];
              final user = context.read<UserBloc>().state.user;
              final isSelected = user.userPreferenceId == userPreference.id;
              return PreferenceCard(
                title: userPreference.displayName.toString(),
                isSelected: isSelected,
                onTap: () {
                  final data = {
                    'userPreferenceId': isSelected ? null : userPreference.id
                  };
                  context.read<UserBloc>().add(
                      UpdateUser(context.read<UserBloc>().state.user, data));
                  context.pop();
                },
              );
            },
            itemCount: userPreferences.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 7.0),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class PreferenceCard extends StatelessWidget {
  const PreferenceCard(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(
                isSelected ? 'Unapply' : 'Apply',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )
            ],
          ),
        ));
  }
}
