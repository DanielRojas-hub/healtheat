import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preferences.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 15.0),
        const HorizontalScrollBar(),
        const SizedBox(height: 15.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Set your food preferences",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        const SizedBox(height: 5.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Preference name",
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(height: 7.0),
        const DisplayNameInput(),
        const SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Preference list",
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(height: 7.0),
        const PreferenceWrap(),
        const SizedBox(height: 20),
        const SubmitButton(),
        if (context.read<UserBloc>().state.user.isEmpty) const SkipButton(),
        const SizedBox(height: 20),
      ]),
    );
  }
}
