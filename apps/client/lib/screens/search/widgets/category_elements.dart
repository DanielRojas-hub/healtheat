import 'package:common/common.dart';
import 'package:common/services/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryElements extends StatelessWidget {
  const CategoryElements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: ((context, state) {
      final selectedCategories = state.categoryIds;

      return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
        if (state is CategoriesLoaded) {
          final categories = state.categories;
          return Row(
              children: List.generate(
            categories.length,
            (index) {
              final category = categories[index];
              final isSelected = selectedCategories?.contains(category.id);
              final isFirst = index == 0;

              if (isSelected ?? false) {
                return Padding(
                    padding: EdgeInsets.only(left: !isFirst ? 8.0 : 0),
                    child: CustomChip(label: category.displayName.toString()));
              }
              return const SizedBox();
            },
          ));
        }
        if (state is CategoryLoading) {
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
