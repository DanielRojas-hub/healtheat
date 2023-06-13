import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/widgets/custom_tab.dart';

class RestaurantDetailsTab extends StatelessWidget {
  const RestaurantDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (context, state) => CustomTabNav(
          onTap: (TabElement selectedTab) =>
              context.read<TabCubit>().onTap(selectedTab),
          tabList: state.tabList,
          selectedIndex: state.selectedIndex),
    );
  }
}