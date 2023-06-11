import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'custom_icon_button.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          iconData: iconData,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          iconSize: 30,
          padding: const EdgeInsets.all(10.0),
          elevation: 0,
          onTap: onTap,
          borderRadius: BorderRadius.circular(Constants.radiusSmall),
        ),
        label,
      ],
    );
  }
}
