import 'package:client/screens/preferences_filter/cubit/select_preferences_cubit.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preferences_filter.dart';

class PreferencesFilterPage extends StatelessWidget {
  const PreferencesFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PreferenceBloc>(
        create: (context) => PreferenceBloc()..add(const StreamPreferences()),
      ),
      BlocProvider<SelectPreferencesCubit>(
        create: (context) => SelectPreferencesCubit(),
      )
    ], child: const PreferencesFilterView());
  }
}