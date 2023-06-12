import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FilterWrap extends StatelessWidget {
  const FilterWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 7.0,
        runSpacing: 7.0,
        children: List.generate(
          10,
          (index) => CustomLabelButton(
              label: const Text("Burger"),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ));
  }
}