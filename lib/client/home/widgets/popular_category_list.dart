import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import '../home.dart';

class PopularCategoryList extends StatelessWidget {
  const PopularCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(25, (index) {
          final isFirst = index == 0;
          return Padding(
            padding: EdgeInsets.only(
                left: isFirst ? Constants.margin : 0, right: 15.0),
            child: PopularCategoryCard(
              label: const Text("Burger"),
              onTap: () {},
            ),
          );
        }),
      ),
    );
  }
}
