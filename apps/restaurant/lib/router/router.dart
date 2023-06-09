import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/register/view/register_page.dart';

import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/register',
    routes: [
      GoRoute(
          path: '/',
          name: RouteName.splashScreen,
          builder: (context, state) => const Scaffold(
                body: Text('Funciona'),
              )),
      GoRoute(
          path: '/register',
          name: RouteName.registerRestaurant,
          builder: (context, state) => const RegisterPage()),
    ],
  );
}
