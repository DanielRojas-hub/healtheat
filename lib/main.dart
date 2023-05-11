import 'package:flutter/material.dart';
import 'package:healtheat/client/search/search.dart';
import 'package:healtheat/common/themes/light_theme.dart';

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
      home: const SearchPage(),
    );
  }
}
