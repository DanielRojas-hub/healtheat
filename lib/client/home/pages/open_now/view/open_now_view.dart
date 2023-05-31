import 'package:flutter/material.dart';

import '../open_now.dart';

class OpenNowView extends StatelessWidget {
  const OpenNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const OpenNowList(),
    );
  }
}
