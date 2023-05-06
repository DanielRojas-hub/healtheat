import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class CustomSingleIcon extends StatelessWidget {
  const CustomSingleIcon({Key? key, this.onTap, required this.iconData})
      : super(key: key);

  final VoidCallback? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.radiusSmall)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Constants.radiusSmall),
        child: Ink(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Constants.radiusSmall)),
          child: Icon(iconData,
              size: 20, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
