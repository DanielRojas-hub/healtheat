import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/controllers/custom_nav_bar/custom_nav_bar_cubit.dart';
import 'package:healtheat/common/widgets/custom_nav_bar.dart';

class HomeFormatView extends StatelessWidget {
  const HomeFormatView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
      bottomNavigationBar: BlocBuilder<CustomNavBarCubit, CustomNavBarState>(
        builder: (context, state) => CustomNavBar(
          selectedNav: state.selectedNav,
          navList: state.navList,
          position: state.position,
          onTap: (CustomNavBarItem selectedNavBar) {
            context.read<CustomNavBarCubit>().onTap(selectedNavBar);
            context.goNamed(selectedNavBar.routeName);
          },
        ),
      ),
    );
  }
}
