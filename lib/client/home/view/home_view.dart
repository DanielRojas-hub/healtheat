import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/category_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CategoryButton(
          iconData: Icons.lunch_dining, label: Text("BURGER")),
    );
  }
}
