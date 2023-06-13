import 'dart:async';

import 'package:common/services/services.dart';
import 'package:common/services/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            path: '/',
            name: RouteName.splashScreen,
            builder: (context, state) => const Scaffold(
                  body: Text('Funciona'),
                )),
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
