import 'dart:async';

import 'package:common/page_builders/page_builders.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/format/home_format/home_format.dart';
import 'package:restaurant/screens/add_food/add_food.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';
import 'package:restaurant/screens/food_details/food_detail.dart';
import 'package:restaurant/screens/edit/edit.dart';
import 'package:restaurant/screens/home/home.dart';
import 'package:restaurant/screens/login/login.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';
import 'package:restaurant/screens/register/view/register_page.dart';
import 'package:restaurant/screens/order_detail/order_detail.dart';
import 'package:restaurant/screens/sign_up/sign_up.dart';

import '../screens/orders/view/view.dart';
import '../screens/edit/pages/info/pages/pages.dart';
import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  late final GoRouterRefreshStream userService;
  GoRouter get router => _goRouter;

  AppRouter(this.userService);

  late final GoRouter _goRouter = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      refreshListenable: userService,
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: RouteName.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/sign_up',
          name: RouteName.signUp,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
            path: '/register_restaurant',
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
              GoRoute(
                  path: '/orders',
                  name: RouteName.orders,
                  builder: (context, state) => const OrdersPage(),
                  routes: [
                    GoRoute(
                      path: ':orderId',
                      name: RouteName.orderDetail,
                      builder: (context, state) => OrderDetailPage(
                        orderId: state.pathParameters['orderId'].toString(),
                      ),
                    ),
                  ]),
            ]),
      ],
      redirect: (context, state) {
        final appState = userService.authenticationState;

        final isGoingToLogin = state.matchedLocation == '/login';
        final isGoingToSignUp = state.matchedLocation == '/sign_up';

        final isGoingToRegisterRestaurant =
            state.matchedLocation == '/register_restaurant';
        final isGoingToTimePicker =
            state.matchedLocation == '/register_restaurant/time_picker';

        final isGoingToUnauthenticated = isGoingToLogin || isGoingToSignUp;

        final isGoingToRegisterRestaurantRoutes =
            isGoingToRegisterRestaurant || isGoingToTimePicker;

        switch (appState.status) {
          case AuthenticationStatus.authenticated:
            final userState = userService.userState;

            switch (userState.status) {
              case UserStatus.success:
                final user = userState.user;
                if ((isGoingToUnauthenticated ||
                        isGoingToRegisterRestaurantRoutes) &&
                    user.restaurantId != null) {
                  return '/home/${user.restaurantId}';
                }
                if (!isGoingToRegisterRestaurantRoutes &&
                    user.restaurantId == null) {
                  return '/register_restaurant';
                }
              case UserStatus.failure:
                break;
              case UserStatus.loading:
                break;
            }

          case AuthenticationStatus.unauthenticated:
            if (!isGoingToUnauthenticated) {
              return '/login';
            }
        }

        return null;
      });
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<AuthenticationState>
      _authenticationSubscription;
  late final StreamSubscription<UserState> _userSubscription;

  late AuthenticationState authenticationState;
  late UserState userState;

  GoRouterRefreshStream(
      {required AuthenticationBloc authenticationBloc,
      required UserBloc userBloc}) {
    //App init state
    authenticationState = authenticationBloc.state;
    notifyListeners();
    //User init state
    userState = userBloc.state;
    notifyListeners();
    //App listener
    _authenticationSubscription = authenticationBloc.stream.listen((state) {
      authenticationState = state;
      notifyListeners();
    });
    //User listener
    _userSubscription = userBloc.stream.listen((state) {
      userState = state;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _authenticationSubscription.cancel();
    _userSubscription.cancel();
    super.dispose();
  }
}
