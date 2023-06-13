import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';

class FilterRadio extends StatelessWidget {
  const FilterRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomIconButton(
        onTap: () {},
        iconData: Icons.check_box,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 22,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(2.0),
        borderRadius: BorderRadius.zero,
      ),
      const SizedBox(width: 7.0),
      Text('High rating', style: Theme.of(context).textTheme.titleSmall),
    ]);
  }
}
