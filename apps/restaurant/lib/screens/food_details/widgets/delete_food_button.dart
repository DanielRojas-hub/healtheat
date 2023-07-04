import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';

class DeleteFoodButton extends StatelessWidget {
  DeleteFoodButton({super.key});
  final FoodRepository foodRepository = FoodRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          final food = state.food;
          return Expanded(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Delete"),
                          content: const Text(
                              "Are you sure that you want to delete this food?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  foodRepository.deleteFood(
                                      food.restaurantId, food.id);
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Food deleted'),
                                            Icon(
                                              Icons.done,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  Navigator.pop(context);
                                  context.goNamed(
                                    RouteName.home,
                                    pathParameters: {
                                      'restaurantId': food.restaurantId
                                    },
                                  );
                                },
                                child: const Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                          ],
                        ),
                    barrierDismissible: false);
              },
              child: const Text("Delete food"),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
