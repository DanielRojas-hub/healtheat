import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  // final Double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.search_rounded, size: 20),
            hintText: "Search...",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusLarge),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusLarge),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusLarge),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusLarge),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error))),
      ),
    );
  }
}
