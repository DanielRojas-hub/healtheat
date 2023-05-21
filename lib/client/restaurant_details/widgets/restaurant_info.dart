import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
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
      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Text(name,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30)),
      ),
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomLabelButton(
          label: Text(rate),
          icon: Icons.star_rate_rounded,
          backgroundColor: context.theme.whiteColor,
          color: context.theme.blackColor,
          iconColor: context.theme.rateColor,
        ),
        const SizedBox(width: 20),
        CustomLabelButton(
          icon: Icons.electric_scooter,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          label: Text(price, style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(width: 20),
        CustomLabelButton(label: Text(time), icon: Icons.schedule)
      ]),
      const SizedBox(height: 40),
      BlocBuilder<TabCubit, TabState>(
          builder: (context, state) => TabWidget(
              onTap: (TabElement selectedTab) =>
                  context.read<TabCubit>().onTap(selectedTab),
              selectedTab: state.selectedTab,
              tabList: restaurantDetailsTabList)),
      const SizedBox(height: 30),
      const MenuView(),
    ]);
  }
}
