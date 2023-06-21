import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/add_food/add_food.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personalization",
              style: Theme.of(context).textTheme.headlineSmall),
          Text("Personalize your restaurant...",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 30),
          Text("All the menus!", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const AllMenus(),
          const SizedBox(height: 30),
          Text("All the categories!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const AllCategorys(),
          const SizedBox(height: 30),
          Text("All the preferences!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const AllPreference(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class AllMenus extends StatelessWidget {
  const AllMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      builder: (context, state) {
        final selectedMenuIds = state.menuIds;
        return BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenusLoaded) {
              final menus = state.menus;
              return Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: List.generate(
                    menus.length,
                    (index) {
                      final menu = menus[index];
                      final isSelected = selectedMenuIds.contains(menu.id);

                      return CustomLabelButton(
                        label: Text(menu.displayName.toString()),
                        backgroundColor: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                        onTap: () => isSelected
                            ? context.read<AddFoodCubit>().removeMenu(menu.id)
                            : context.read<AddFoodCubit>().addMenu(menu.id),
                      );
                    },
                  ));
            }
            if (state is MenuLoading) {
              return Wrap(
                spacing: 7.0,
                runSpacing: 7.0,
                children: List.generate(6, (index) => const Skelton(width: 75)),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class AllCategorys extends StatelessWidget {
  const AllCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      builder: (context, state) {
        final selectedCategoryIds = state.categoryIds;
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
                      final isSelected =
                          selectedCategoryIds.contains(category.id);

                      return CustomLabelButton(
                        label: Text(category.displayName.toString()),
                        backgroundColor: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                        onTap: () => isSelected
                            ? context
                                .read<AddFoodCubit>()
                                .removeCategory(category.id)
                            : context
                                .read<AddFoodCubit>()
                                .addCategory(category.id),
                      );
                    },
                  ));
            }
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class AllPreference extends StatelessWidget {
  const AllPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      builder: (context, state) {
        final selectedPreferenceIds = state.preferenceIds;
        return BlocBuilder<PreferenceBloc, PreferenceState>(
          builder: (context, state) {
            if (state is PreferencesLoaded) {
              final preferences = state.preferences;
              return Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: List.generate(
                    preferences.length,
                    (index) {
                      final preference = preferences[index];
                      final isSelected =
                          selectedPreferenceIds.contains(preference.id);

                      return CustomLabelButton(
                        label: Text(preference.displayName.toString()),
                        backgroundColor: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                        onTap: () => isSelected
                            ? context
                                .read<AddFoodCubit>()
                                .removePreference(preference.id)
                            : context
                                .read<AddFoodCubit>()
                                .addPreference(preference.id),
                      );
                    },
                  ));
            }
            if (state is PreferenceLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
