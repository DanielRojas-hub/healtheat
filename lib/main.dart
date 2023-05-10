import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/client/login/login.dart';
import 'package:healtheat/client/register/register.dart';
import 'package:healtheat/client/cart/cart.dart';
import 'package:healtheat/client/favorites/favorites.dart';
import 'package:healtheat/client/search/search.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/themes/light_theme.dart';
import 'package:healtheat/common/widgets/base_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: const HomePage(),
    );
  }
}
