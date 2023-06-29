import 'dart:async';

import 'package:common/page_builders/page_builders.dart';
import 'package:common/services/services.dart';
import 'package:common/services/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/add_food/add_food.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';
import 'package:restaurant/screens/register/view/register_page.dart';
import 'package:restaurant/screens/order_detail/order_detail.dart';

import '../screens/orders/view/view.dart';
import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  late final GoRouterRefreshStream userService;
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      refreshListenable: userService,
      initialLocation: '/',
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
      ],
      redirect: (context, state) {
        final appState = userService.authenticationState;

        switch (appState.status) {
          case AuthenticationStatus.authenticated:
            final userState = userService.userState;

          case AuthenticationStatus.unauthenticated:
        }

        return;
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
