import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/register.dart';

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
          Text("All the cuisines!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const RecommendedCuisines(),
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

class RecommendedCuisines extends StatelessWidget {
  const RecommendedCuisines({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              List<String>? selectedCuisineIds = restaurant.cuisineIds;
              return BlocBuilder<CuisineBloc, CuisineState>(
                builder: (context, state) {
                  if (state is CuisinesLoaded) {
                    final cuisines = state.cuisines;
                    return Wrap(
                        spacing: 7.0,
                        runSpacing: 7.0,
                        children: List.generate(
                          cuisines.length,
                          (index) {
                            final cuisine = cuisines[index];
                            final isSelected =
                                selectedCuisineIds!.contains(cuisine.id);

                            return CustomLabelButton(
                              label: Text(cuisine.displayName.toString()),
                              backgroundColor: isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                              color: isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                              onTap: () => isSelected
                                  ? context
                                      .read<RegisterCubit>()
                                      .removeCuisine(cuisine.id)
                                  : context
                                      .read<RegisterCubit>()
                                      .addCuisine(cuisine.id),
                            );
                          },
                        ));
                  }
                  if (state is CuisineLoading) {
                    return Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children:
                          List.generate(6, (index) => const Skelton(width: 75)),
                    );
                  }
                  return const SizedBox();
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AllMenus extends StatelessWidget {
  const AllMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
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
                            ? context.read<RegisterCubit>().removeMenu(menu.id)
                            : context.read<RegisterCubit>().addMenu(menu.id),
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
    return BlocBuilder<RegisterCubit, RegisterState>(
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
                                .read<RegisterCubit>()
                                .removeCategory(category.id)
                            : context
                                .read<RegisterCubit>()
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedPreferenceIds = state.preferenceIds;
        return BlocBuilder<FoodPreferenceBloc, FoodPreferenceState>(
          builder: (context, state) {
            if (state is FoodPreferencesLoaded) {
              final foodPreferences = state.foodPreferences;
              return Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: List.generate(
                    foodPreferences.length,
                    (index) {
                      final foodPreference = foodPreferences[index];
                      final isSelected =
                          selectedPreferenceIds.contains(foodPreference.id);

                      return CustomLabelButton(
                        label: Text(foodPreference.displayName.toString()),
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
                                .read<RegisterCubit>()
                                .removePreference(foodPreference.id)
                            : context
                                .read<RegisterCubit>()
                                .addPreference(foodPreference.id),
                      );
                    },
                  ));
            }
            if (state is FoodPreferenceLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
