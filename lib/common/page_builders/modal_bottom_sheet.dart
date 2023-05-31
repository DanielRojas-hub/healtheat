import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage(
      {required this.child, this.isScrollControlled = true, super.key});

  final Widget child;
  final bool isScrollControlled;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute(
        settings: this,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) => child,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Constants.radiusMedium))),
      );
}
