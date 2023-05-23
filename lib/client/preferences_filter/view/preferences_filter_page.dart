import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/preference/bloc/preference_bloc.dart';

import '../preferences_filter.dart';

class PreferencesFilterPage extends StatelessWidget {
  const PreferencesFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PreferenceBloc>(
        create: (context) => PreferenceBloc()..add(const StreamPreferences()),
      )
    ], child: const PreferencesFilterView());
  }
}
