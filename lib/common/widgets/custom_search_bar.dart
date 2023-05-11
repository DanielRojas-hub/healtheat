import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.height, this.contentPadding});

  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            contentPadding: contentPadding,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.search_rounded, size: 20),
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusSmall),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusSmall),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusSmall),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Constants.radiusSmall),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error))),
      ),
    );
  }
}
