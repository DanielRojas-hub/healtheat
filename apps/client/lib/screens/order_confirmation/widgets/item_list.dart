import 'package:cart_repository/cart_repository.dart';
import 'package:collection/collection.dart';
import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final status = state.status;
        if (status == CartStatus.notEmpty) {
          final petitions = state.cart.petitions;
          return FoodItemList(petitions: petitions);
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => const SkeletonCartCard(),
          separatorBuilder: (BuildContext context, int index) =>
              const CustomDivider(margin: EdgeInsets.zero),
          itemCount: 3,
        );
      },
    );
  }
}

class FoodItemList extends StatelessWidget {
  const FoodItemList({Key? key, required this.petitions}) : super(key: key);

  final List<Petition> petitions;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          final foods = state.foods;
          return ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final petition = petitions[index];
              final food =
                  foods.firstWhereOrNull((food) => food.id == petition.foodId);
              if (food != null) {
                final total = petition.quantity * (food.price ?? 0);
                return CartCard(
                  title: food.displayName.toString(),
                  counter: 'x${petition.quantity}',
                  suffix: '\$$total',
                  imageUrl: food.imageUrl,
                );
              }
              return const SizedBox();
            },
            itemCount: petitions.length,
            separatorBuilder: (BuildContext context, int index) =>
                const CustomBackgroundWidget(
                    child: CustomDivider(margin: EdgeInsets.zero)),
          );
        }
        if (state is FoodLoading) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => const SkeletonCartCard(),
            separatorBuilder: (BuildContext context, int index) =>
                const CustomDivider(margin: EdgeInsets.zero),
            itemCount: 3,
          );
        }
        return const SizedBox();
      },
    );
  }
}
