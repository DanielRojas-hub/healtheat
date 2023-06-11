import 'package:common/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: lightTheme(),
          routerConfig: routerConfig,
        );
      }),
    );
  }
}
