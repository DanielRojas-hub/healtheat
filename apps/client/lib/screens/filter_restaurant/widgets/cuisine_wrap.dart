import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuisineWrap extends StatelessWidget {
  const CuisineWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: ((context, state) {
      final selectedCuisines = state.cuisineList;

      return BlocBuilder<CuisineBloc, CuisineState>(builder: (context, state) {
        if (state is CuisinesLoaded) {
          final cuisines = state.cuisines;
          return Wrap(
              spacing: 7.0,
              runSpacing: 7.0,
              children: List.generate(cuisines.length, (index) {
                final cuisine = cuisines[index];
                final isSelected = selectedCuisines.contains(cuisine.id);

                return CustomLabelButton(
                  label: Text(cuisine.displayName.toString()),
                  backgroundColor: isSelected
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.secondaryContainer,
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                  onTap: isSelected
                      ? () => context
                          .read<FilterBloc>()
                          .add(RemoveCuisine(cuisine.id))
                      : () => context
                          .read<FilterBloc>()
                          .add(AddCuisine(cuisine.id)),
                );
              }));
        }
        if (state is CuisineLoading) {
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
