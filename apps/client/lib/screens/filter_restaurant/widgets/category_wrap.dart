import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWrap extends StatelessWidget {
  const CategoryWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: ((context, state) {
      final selectedCategories = state.categoryIds;

      return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
        if (state is CategoriesLoaded) {
          final categories = state.categories;
          return Wrap(
              spacing: 7.0,
              runSpacing: 7.0,
              children: List.generate(
                categories.length,
                (index) {
                  final category = categories[index];
                  final isSelected = selectedCategories.contains(category.id);

                  return CustomLabelButton(
                    label: Text(category.displayName.toString()),
                    backgroundColor: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.secondaryContainer,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                    onTap: isSelected
                        ? () => context
                            .read<FilterBloc>()
                            .add(RemoveCategory(category.id))
                        : () => context
                            .read<FilterBloc>()
                            .add(AddCategory(category.id)),
                  );
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
