import 'package:common/services/services.dart';
import 'package:common/widgets/custom_preference.dart';
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
          RecommendedCuisines(),
          const SizedBox(height: 30),
          Text("All the menus!", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          AllMenus(),
          const SizedBox(height: 30),
          Text("All the categories!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          AllCategorys(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class RecommendedCuisines extends StatelessWidget {
  const RecommendedCuisines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedCuisineIds = state.cuisineIds;
        return BlocBuilder<CuisineBloc, CuisineState>(
          builder: (context, state) {
            if (state is CuisinesLoaded) {
              final cuisines = state.cuisines;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                children: List.generate(cuisines.length, (index) {
                  final cuisine = cuisines[index];
                  final isSelected = selectedCuisineIds.contains(cuisine.id);
                  return OptionPreference(
                    isSelected: isSelected,
                    title: Text(
                      cuisine.displayName.toString(),
                      maxLines: 1,
                    ),
                    onTap: () => isSelected
                        ? context
                            .read<RegisterCubit>()
                            .removeCuisine(cuisine.id)
                        : context.read<RegisterCubit>().addCuisine(cuisine.id),
                  );
                }),
              );
            }
            if (state is CuisineLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class AllMenus extends StatelessWidget {
  const AllMenus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedMenuIds = state.menuIds;
        return BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenusLoaded) {
              final menus = state.menus;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                children: List.generate(menus.length, (index) {
                  final menu = menus[index];
                  final isSelected = selectedMenuIds.contains(menu.id);
                  return OptionPreference(
                    isSelected: isSelected,
                    title: Text(
                      menu.displayName.toString(),
                      maxLines: 1,
                    ),
                    onTap: () => isSelected
                        ? context.read<RegisterCubit>().removeMenu(menu.id)
                        : context.read<RegisterCubit>().addMenu(menu.id),
                  );
                }),
              );
            }
            if (state is MenuLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class AllCategorys extends StatelessWidget {
  const AllCategorys({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedCategoryIds = state.categoryIds;
        return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              final categories = state.categories;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  final isSelected = selectedCategoryIds.contains(category.id);
                  return OptionPreference(
                    isSelected: isSelected,
                    title: Text(
                      category.displayName.toString(),
                      maxLines: 1,
                    ),
                    onTap: () => isSelected
                        ? context
                            .read<RegisterCubit>()
                            .removeCategory(category.id)
                        : context
                            .read<RegisterCubit>()
                            .addCategory(category.id),
                  );
                }),
              );
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
  const AllPreference({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedPreferenceIds = state.preferenceIds;
        return BlocBuilder<PreferenceBloc, PreferenceState>(
          builder: (context, state) {
            if (state is PreferencesLoaded) {
              final preferences = state.preferences;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                children: List.generate(preferences.length, (index) {
                  final preference = preferences[index];
                  final isSelected =
                      selectedPreferenceIds.contains(preference.id);
                  return OptionPreference(
                    isSelected: isSelected,
                    title: Text(
                      preference.displayName.toString(),
                      maxLines: 1,
                    ),
                    onTap: () => isSelected
                        ? context
                            .read<RegisterCubit>()
                            .removePreference(preference.id)
                        : context
                            .read<RegisterCubit>()
                            .addPreference(preference.id),
                  );
                }),
              );
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
