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
          Text("Cuisine", style: Theme.of(context).textTheme.headlineSmall),
          // const SizedBox(height: 5),
          Text("Select your cuisines...",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 30),
          Text("Recommended for you!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          RecommendedCuisines(),
          const SizedBox(height: 30),
          Text("All the cuisines",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          AllCuisines(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class AllCuisines extends StatelessWidget {
  const AllCuisines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final selectedCuisineIds = state.cuisineIds;
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 25,
          children: List.generate(
            9,
            (index) => const OptionPreference(
              isSelected: false,
              title: Text("Pizza"),
            ),
          ),
        );
      },
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
                    title: Text(cuisine.displayName.toString()),
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
