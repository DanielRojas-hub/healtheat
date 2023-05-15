import 'package:flutter/material.dart';

import 'constants.dart';

InputDecoration inputDecorationBorderMethod(BuildContext context) {
  return InputDecoration(
    enabledBorder: outlineInputBorderMethod(context)
        .copyWith(borderSide: const BorderSide(color: Colors.transparent)),
    focusedBorder: outlineInputBorderMethod(context).copyWith(
        borderSide: BorderSide(color: Theme.of(context).primaryColor)),
    focusedErrorBorder: outlineInputBorderMethod(context).copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
    errorBorder: outlineInputBorderMethod(context).copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
  );
}

OutlineInputBorder outlineInputBorderMethod(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constants.radiusSmall));
}
