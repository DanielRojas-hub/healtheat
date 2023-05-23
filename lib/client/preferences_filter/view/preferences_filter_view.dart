import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/widgets/image_container.dart';

class PreferencesFilterView extends StatelessWidget {
  const PreferencesFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Text(
                'HealthEat requires you to select your food preferences (if you have)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: context.theme.blackColor,
                      fontWeight: FontWeight.bold,
                    )),
          ),
        ],
      )),
    );
  }
}
