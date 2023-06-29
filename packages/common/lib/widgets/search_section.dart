import 'package:flutter/material.dart';

import 'package:common/widgets/custom_icon_button.dart';
import 'package:common/widgets/custom_search_bar.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection(
      {Key? key, required this.onTapFilter, this.onTapSearch, this.onChanged, this.readOnly})
      : super(key: key);

  final VoidCallback onTapFilter;
  final VoidCallback? onTapSearch;
  final bool? readOnly;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    const double size = 37;

    return Row(children: [
      Expanded(
          child: CustomSearchBar(
        height: size,
        onTap: onTapSearch,
        onChanged: onChanged,
        readOnly: readOnly,
      )),
      const SizedBox(width: 15),
      CustomIconButton(
          iconData: Icons.tune,
          height: size,
          width: size,
          elevation: 0,
          onTap: onTapFilter),
    ]);
  }
}
