import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'package:common/widgets/custom_label_button.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.label, this.onDeleted});

  final String label;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomLabelButton(
        label: Text(label),
        borderRadius: BorderRadius.circular(Constants.radiusSmall),
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        deleteIconColor: Theme.of(context).disabledColor,
        onDeleted: onDeleted,
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 6),
      ),
    );
  }
}
