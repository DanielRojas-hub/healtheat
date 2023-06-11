import 'package:common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SvgPicture.asset(image)),
        Text(title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: context.theme.blackColor,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ],
    );
  }
}
