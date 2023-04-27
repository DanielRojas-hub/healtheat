import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomLabelButtom(
                title: 'Sushi',
                icon: Icons.schedule,
                onTap: () => print("A"))));
  }
}
