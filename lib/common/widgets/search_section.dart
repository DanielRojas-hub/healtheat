// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_search_bar.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({
    Key? key,
    required this.goRouteName,
  }) : super(key: key);

  final String goRouteName;

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
        onTap: () => context.goNamed(goRouteName),
      ),
    ]);
  }
}
