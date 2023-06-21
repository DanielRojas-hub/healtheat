import 'package:common/controllers/controllers.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          navList: state.navList,
          index: state.index,
          onTap: (NavBarItem selectedNavBar) {
            context.read<CustomNavBarCubit>().onTap(selectedNavBar);
            context.goNamed(selectedNavBar.routeName);
          },
        ),
      ),
    );
  }
}
