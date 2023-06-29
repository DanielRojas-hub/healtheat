import 'package:restaurant/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActiveOrdersList extends StatelessWidget {
  const ActiveOrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantsLoaded) {
          final restaurants = state.restaurants;
          return BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrdersLoaded) {
                final orders = state.orders;
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.margin,
                      vertical: Constants.marginSmall),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (BuildContext context, int index) {
                    final order = orders[index];
                    if (order.status < 3) {
                      return OrderCard(
                          orderId: order.id,
                          restaurantName: restaurants
                              .firstWhere(
                                  (element) => element.id == order.restaurantId)
                              .displayName as String,
                          status: order.status,
                          //foods: const ['coco', 'papa', 'pepe', 'pipo'],
                          onTap: () => context.goNamed(RouteName.orderDetail,
                              pathParameters: {'orderId': order.id}),
                          onTapFavorite: () {});
                    }
                  },
                  itemCount: orders.length,
                );
              }
              if (state is OrderLoading) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.margin,
                      vertical: Constants.marginSmall),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (BuildContext context, int index) =>
                      const SkeletonOrderCard(),
                  itemCount: 3,
                );
              }
              return const SizedBox();
            },
          );
        }
        if (state is RestaurantLoading) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.margin, vertical: Constants.marginSmall),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 15),
            itemBuilder: (BuildContext context, int index) =>
                const SkeletonOrderCard(),
            itemCount: 3,
          );
        }
        return const SizedBox();
      },
    );
  }
}
