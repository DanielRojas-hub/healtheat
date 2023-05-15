import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/input_border.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        decoration: inputDecorationBorderMethod(context).copyWith(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          filled: true,
          fillColor: Theme.of(context).colorScheme.tertiaryContainer,
          prefixIcon: const Icon(Icons.search_rounded, size: 20),
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
