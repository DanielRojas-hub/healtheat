import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWrap extends StatelessWidget {
  const MenuWrap({super.key});

  @override
  Widget build(BuildContext context) {
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
                return CustomLabelButton(
                    label: Text(menu.displayName.toString()),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    color: Theme.of(context).colorScheme.onSecondaryContainer);
              },
            ));
      }
      if (state is MenuLoading) {
        return const Skelton(width: 150);
      }
      return const SizedBox();
    });
  }
}
