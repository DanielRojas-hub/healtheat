import 'package:cart_repository/cart_repository.dart';
import 'package:common/services/services.dart';
import 'package:common/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppRouter(),
      child: Builder(builder: (context) {
        final routerConfig =
            Provider.of<AppRouter>(context, listen: false).router;

        return MultiBlocProvider(
          providers: [
            BlocProvider<UserPreferenceBloc>(
              create: (context) =>
                  UserPreferenceBloc()..add(GetUserPreference()),
            ),
            BlocProvider<CartBloc>(
              create: (context) =>
                  CartBloc(cartRepository: CartRepository())..add(GetCart()),
            ),
          ],
          child: MaterialApp.router(
            title: 'Flutter Demo',
            theme: lightTheme(),
            routerConfig: routerConfig,
          ),
        );
      }),
    );
  }
}
