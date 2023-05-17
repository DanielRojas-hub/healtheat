import 'package:flutter/material.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/client/login/login.dart';
import 'package:healtheat/client/profile/profile.dart';
import 'package:healtheat/client/register/register.dart';
import 'package:healtheat/client/search/search.dart';
import 'package:healtheat/client/splash_screen/splash_screen.dart';
import 'package:healtheat/common/router/router.dart';
import 'package:healtheat/common/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
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
