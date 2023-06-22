import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuElements extends StatelessWidget {
  const MenuElements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: ((context, state) {
      final selectedMenus = state.menuList;

      return BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
        if (state is MenusLoaded) {
          final menus = state.menus;
          return Wrap(
              spacing: 7.0,
              runSpacing: 7.0,
              children: List.generate(
                menus.length,
                (index) {
                  final menu = menus[index];
                  final isSelected = selectedMenus.contains(menu.id);
                  final isFirst = index == 0;

                  if (isSelected) {
                    return Padding(
                        padding: EdgeInsets.only(left: !isFirst ? 8.0 : 0),
                        child: CustomChip(label: menu.displayName.toString()));
                  }
                  return const SizedBox();
                },
              ));
        }
        if (state is MenuLoading) {
          return Wrap(
              spacing: 7.0,
              runSpacing: 7.0,
              children: List.generate(6, (index) => const Skelton(width: 75)));
        }
        return const SizedBox();
      });
    }));
  }
}