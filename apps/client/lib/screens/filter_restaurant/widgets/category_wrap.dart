import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWrap extends StatelessWidget {
  const CategoryWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoriesLoaded) {
        final categories = state.categories;
        return Wrap(
            spacing: 7.0,
            runSpacing: 7.0,
            children: List.generate(
              categories.length,
              (index) {
                final category = categories[index];
                return CustomLabelButton(
                    label: Text(category.displayName.toString()),
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
