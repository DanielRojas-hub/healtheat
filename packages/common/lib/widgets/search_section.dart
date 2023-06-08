import 'package:flutter/material.dart';

import 'package:common/widgets/custom_icon_button.dart';
import 'package:common/widgets/custom_search_bar.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const double size = 37;

    return Row(children: [
      const Expanded(child: CustomSearchBar(height: size)),
      const SizedBox(width: 15),
      CustomIconButton(
          iconData: Icons.tune,
          height: size,
          width: size,
          elevation: 0,
          onTap: onTap),
    ]);
  }
}
