import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/format/home_format/home_format.dart';
import 'package:restaurant/screens/add_food/add_food.dart';
import 'package:restaurant/screens/home/home.dart';
import 'package:restaurant/screens/menu/menu.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';
import 'package:restaurant/screens/register/view/register_page.dart';

import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/home/ff99b4b4-80bf-4ec6-bb2b-b87986a1f3e1',
      routes: [
        GoRoute(
            path: '/register',
            name: RouteName.registerRestaurant,
            builder: (context, state) => const RegisterPage(),
            routes: [
              GoRoute(
                path: 'time_picker',
                name: RouteName.timePicker,
                pageBuilder: (context, state) {
                  final initTime = state.queryParameters['initTime'];
                  final timePickerType = state.queryParameters['type'] == 'open'
                      ? TimePickerType.open
                      : TimePickerType.close;
                  return DialogPage(
                      child: TimePickerPage(
                    timePickerType: timePickerType,
                    initTime: initTime,
                  ));
                },
              )
            ]),
        GoRoute(
            path: '/:restaurantId/add_food',
            name: RouteName.addFood,
            builder: (context, state) => AddFoodPage(
                  restaurantId: state.pathParameters['restaurantId'],
                )),
        ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (context, state, child) => HomeFormatPage(child: child),
            routes: [
              GoRoute(
                  path: '/home/:restaurantId',
                  parentNavigatorKey: shellNavigatorKey,
                  name: RouteName.home,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: HomePage(
                          restaurantId:
                              state.pathParameters['restaurantId'].toString()),
                    );
                  },
                  routes: [
                    // GoRoute(
                    //     path: 'add_food',
                    //     name: RouteName.addFood,
                    //     builder: (context, state) => AddFoodPage(
                    //           restaurantId:
                    //               state.pathParameters['restaurantId'],
                    //         )),
                    GoRoute(
                        path: 'food/:foodId',
                        name: RouteName.food,
                        builder: (context, state) => AddFoodPage(
                              restaurantId:
                                  state.pathParameters['restaurantId'],
                            ),
                        routes: [
                          GoRoute(
                              path: 'edit',
                              name: RouteName.editFood,
                              builder: (context, state) => AddFoodPage(
                                    restaurantId:
                                        state.pathParameters['restaurantId'],
                                  )),
                        ]),
                    GoRoute(
                        path: 'edit',
                        name: RouteName.editRestaurant,
                        builder: (context, state) => AddFoodPage(
                              restaurantId:
                                  state.pathParameters['restaurantId'],
                            )),
                  ]),
              // GoRoute(
              //     path: '/:restaurantId/menu',
              //     name: RouteName.menu,
              //     builder: (context, state) => MenuPage(
              //           restaurantId:
              //               state.pathParameters['restaurantId'].toString(),
              //           foodRouteName: state.pathParameters[''].toString(),
              //         )),
            ])
      ]);

  // GoRoute foodGoRoute(String foodRouteName, {bool? isSingle}) {
  //   return GoRoute(
  //       path: 'food/:foodId',
  //       parentNavigatorKey: rootNavigatorKey,
  //       name: foodRouteName,
  //       builder: (context, state) => FoodDetailsPage(
  //             restaurantId: state.pathParameters['restaurantId'].toString(),
  //             foodId: state.pathParameters['foodId'].toString(),
  //           ));
  // }
}
