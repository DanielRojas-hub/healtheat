import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWrap extends StatelessWidget {
  const MenuWrap({super.key});

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

                  return CustomLabelButton(
                    label: Text(menu.displayName.toString()),
                    backgroundColor: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.secondaryContainer,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                    onTap: isSelected
                        ? () =>
                            context.read<FilterBloc>().add(RemoveMenu(menu.id))
                        : () =>
                            context.read<FilterBloc>().add(AddMenu(menu.id)),
                  );
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
