import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../menu_preferences.dart';

class MenuPreferencesPage extends StatelessWidget {
  const MenuPreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UserPreferenceBloc>(
          create: (context) => UserPreferenceBloc()
            ..add(
                StreamUserPreferences(context.read<UserBloc>().state.user.id)))
    ], child: const MenuPreferencesView());
  }
}
