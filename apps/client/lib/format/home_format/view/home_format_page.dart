import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_format.dart';

class HomeFormatPage extends StatelessWidget {
  const HomeFormatPage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserPreferenceBloc>(
            create: (context) => UserPreferenceBloc()
              ..add(UserBlocUserPreference(context.read<UserBloc>()))),
        BlocProvider<CustomNavBarCubit>(
            create: (context) => CustomNavBarCubit(navList: navList)),
      ],
      child: HomeFormatView(child: child),
    );
  }
}
