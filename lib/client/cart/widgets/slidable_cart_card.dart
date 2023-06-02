import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_repository/food_repository.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';

class SlidableCartCard extends StatelessWidget {
  const SlidableCartCard(
      {Key? key,
      required this.child,
      required this.food,
      required this.petition})
      : super(key: key);

  final Widget child;
  final Food food;
  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) =>
                context.read<CartBloc>().add(RemovePetition(food.id)),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            icon: Icons.delete,
          ),
        ],
      ),
      child: child,
    );
  }
}
