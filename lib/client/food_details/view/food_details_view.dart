import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/widgets/custom_footer.dart';
import 'package:healtheat/client/food_details/widgets/food_info.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: FoodFooter(),
        body: CustomScrollView(
          slivers: [
            FoodAppBar(),
            FoodInformation(),
          ],
        ));
  }
}

class FoodFooter extends StatelessWidget {
  const FoodFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;

          return CustomFooter(
            price: Text(food.price.toString()),
            label: const Text('Total price: '),
            onPressed: () {},
            textButton: const Text('Add to cart'),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class FoodInformation extends StatelessWidget {
  const FoodInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;

          return SliverToBoxAdapter(
            child: FoodInfo(
                title: Text(food.displayName),
                price: Text(food.price.toString()),
                subtitle: Text(food.description)),
          );
        }
        if (state is FoodLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;

          return CustomAppBar(
              isFavorite: true, imageUrl: food.imageUrl, height: 275);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
