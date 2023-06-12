import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuisineWrap extends StatelessWidget {
  const CuisineWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuisineBloc, CuisineState>(builder: (context, state) {
      if (state is CuisinesLoaded) {
        final cuisines = state.cuisines;
        return Wrap(
            spacing: 7.0,
            runSpacing: 7.0,
            children: List.generate(
              cuisines.length,
              (index) {
                final cuisine = cuisines[index];
                return CustomLabelButton(
                    label: Text(cuisine.displayName.toString()),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    color: Theme.of(context).colorScheme.onSecondaryContainer);
              },
            ));
      }
      if (state is CategoryLoading) {
        return const Skelton(width: 150);
      }
      return const SizedBox();
    });
  }
}
