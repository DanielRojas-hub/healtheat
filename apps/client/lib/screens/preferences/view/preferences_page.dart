import 'package:authentication_repository/authentication_repository.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preferences.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FoodPreferenceBloc>(
        create: (context) => FoodPreferenceBloc()..add(StreamFoodPreferences()),
      ),
      BlocProvider<PreferencesCubit>(
        create: (context) =>
            PreferencesCubit(context.read<AuthenticationRepository>()),
      ),
    ], child: const PreferencesView());
  }
}
