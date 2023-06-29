import 'package:common/utils/constants.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage(
      {required this.child,
      this.isScrollControlled = true,
      this.isDismissible = true,
      this.enableDrag = true,
      super.key});

  final Widget child;
  final bool isDismissible;
  final bool isScrollControlled;
  final bool enableDrag;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute(
        settings: this,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        builder: (context) => child,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Constants.radiusMedium))),
      );
}
