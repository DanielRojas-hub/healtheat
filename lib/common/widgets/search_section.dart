import 'package:flutter/material.dart';
import 'package:healtheat/client/filter_restaurant/filter_restaurant.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';
import 'package:healtheat/common/widgets/custom_search_bar.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

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
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return const FilterRestaurantView();
            },
          );
        },
      ),
    ]);
  }
}
