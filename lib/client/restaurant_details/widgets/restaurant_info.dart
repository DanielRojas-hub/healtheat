import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';
import 'package:healtheat/common/widgets/tab_widget.dart';
import '../restaurant_details.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo(
      {super.key,
      required this.name,
      required this.price,
      required this.rate,
      required this.time});

  final String name;
  final String price;
  final String rate;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      Text(name, style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CustomLabelButton(
          label: Text(rate),
          icon: Icons.star_rate_rounded,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          iconColor: context.theme.rateColor,
        ),
        CustomLabelButton(
          icon: Icons.electric_scooter,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: Text(price, style: Theme.of(context).textTheme.labelMedium),
        ),
        CustomLabelButton(label: Text(time), icon: Icons.schedule)
      ]),
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: BlocBuilder<TabCubit, TabState>(
            builder: (context, state) => TabWidget(
                onTap: (TabElement selectedTab) =>
                    context.read<TabCubit>().onTap(selectedTab),
                selectedTab: state.selectedTab,
                tabList: restaurantDetailsTabList)),
      ),
    ]);
  }
}
