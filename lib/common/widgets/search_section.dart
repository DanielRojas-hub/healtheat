import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_search_bar.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 37;

    return Row(children: const [
      Expanded(child: CustomSearchBar(height: size)),
      SizedBox(width: 15),
      CustomIconButton(
          iconData: Icons.tune, height: size, width: size, elevation: 0),
    ]);
  }
}
