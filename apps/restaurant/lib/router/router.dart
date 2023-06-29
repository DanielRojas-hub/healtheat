import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/format/home_format/home_format.dart';
import 'package:restaurant/screens/add_food/add_food.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';
import 'package:restaurant/screens/food_details/food_detail.dart';
import 'package:restaurant/screens/edit/edit.dart';
import 'package:restaurant/screens/edit/pages/info/pages/time_picker/view/time_edit_view.dart';
import 'package:restaurant/screens/home/home.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';
import 'package:restaurant/screens/register/view/register_page.dart';

import '../screens/edit/pages/info/pages/pages.dart';
import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      // initialLocation: '/home/ff99b4b4-80bf-4ec6-bb2b-b87986a1f3e1',
      initialLocation: '/register',
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
                  GoRoute(
                    path: 'add_food',
                    name: RouteName.addFood,
                    builder: (context, state) => AddFoodPage(
                      restaurantId: state.pathParameters['restaurantId'],
                    ),
                  ),
                  GoRoute(
                    path: 'food/:foodId',
                    name: RouteName.food,
                    builder: (context, state) => FoodDetailsPage(
                      restaurantId:
                          state.pathParameters['restaurantId'].toString(),
                      foodId: state.pathParameters['foodId'].toString(),
                    ),
                  ),
                  GoRoute(
                    path: 'edit/:foodId',
                    name: RouteName.editFood,
                    builder: (context, state) => EditFoodPage(
                      restaurantId:
                          state.pathParameters['restaurantId'].toString(),
                      foodId: state.pathParameters['foodId'].toString(),
                    ),
                  ),
                  GoRoute(
                    path: 'edit_restaurant',
                    name: RouteName.editRestaurant,
                    builder: (context, state) => EditPage(
                        restaurantId:
                            state.pathParameters['restaurantId'].toString()),
                    routes: [
                      GoRoute(
                        path: 'time_edit_picker',
                        name: RouteName.timeEditPicker,
                        pageBuilder: (context, state) {
                          final initTime = state.queryParameters['initTime'];
                          final timePickerEditType =
                              state.queryParameters['type'] == 'open'
                                  ? TimePickerEditType.open
                                  : TimePickerEditType.close;
                          return DialogPage(
                              child: TimeEditPage(
                            timePickerEditType: timePickerEditType,
                            initTime: initTime,
                          ));
                        },
                      )
                    ],
                  ),
                ],
              ),

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
}
