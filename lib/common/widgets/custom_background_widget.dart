import 'package:flutter/material.dart';

import 'base_card.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      child: child,
    );
  }
}
