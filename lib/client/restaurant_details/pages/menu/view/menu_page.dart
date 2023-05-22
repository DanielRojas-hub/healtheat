// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key? key,
    required this.foodName,
  }) : super(key: key);

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return MenuView(foodName: foodName);
  }
}
