import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';
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
          path: '/register',
          name: RouteName.registerRestaurant,
          builder: (context, state) => const RegisterPage(),
          routes: [
            GoRoute(
              path: 'time_picker',
              name: RouteName.timePicker,
              pageBuilder: (context, state) {
                final timePickerType = state.queryParameters['type'] == 'open'
                    ? TimePickerType.open
                    : TimePickerType.close;
                return DialogPage(
                    child: TimePickerPage(timePickerType: timePickerType));
              },
            )
          ]),
    ],
  );
}
