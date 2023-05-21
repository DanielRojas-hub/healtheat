import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

import '../restaurant_details.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return const [
          CustomAppBar(
            image:
                'https://hips.hearstapps.com/hmg-prod/images/dsc01939-1638289406.jpg',
            isFavorite: true,
            height: 200,
          ),
          SliverToBoxAdapter(
              child: RestaurantInfo(
            name: "Vero Vero",
            price: "\$10 - \$15",
            rate: "4,8",
            time: "25-35 min",
          ))
        ];
      },
      body: PageView(
          controller: context.read<TabCubit>().controller,
          onPageChanged: (index) =>
              context.read<TabCubit>().onPageChanged(index),
          children: const [MenuPage(), ReviewPage(), MenuPage()]),
    ));
  }
}
