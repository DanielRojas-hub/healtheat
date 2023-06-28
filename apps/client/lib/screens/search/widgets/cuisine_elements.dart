import 'package:common/services/search/search_bloc.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuisineElements extends StatelessWidget {
  const CuisineElements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: ((context, state) {
      final selectedCuisines = state.cuisineIds;

      return BlocBuilder<CuisineBloc, CuisineState>(builder: (context, state) {
        if (state is CuisinesLoaded) {
          final cuisines = state.cuisines;
          return Row(
              children: List.generate(cuisines.length, (index) {
            final cuisine = cuisines[index];
            final isSelected = selectedCuisines?.contains(cuisine.id);

            final isFirst = index == 0;

            if (isSelected ?? false) {
              return Padding(
                  padding: EdgeInsets.only(left: !isFirst ? 8.0 : 0),
                  child: CustomChip(label: cuisine.displayName.toString()));
            }
            return const SizedBox();
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
