import 'dart:async';

import 'package:client/format/home_format/home_format.dart';
import 'package:client/screens/cart/cart.dart';
import 'package:client/screens/favorites/favorites.dart';
import 'package:client/screens/filter_restaurant/filter_restaurant.dart';
import 'package:client/screens/food_details/food_detail.dart';
import 'package:client/screens/home/home.dart';
import 'package:client/screens/login/login.dart';
import 'package:client/screens/menu_preferences/menu_preferences.dart';
import 'package:client/screens/order_confirmation/order_confirmation.dart';
import 'package:client/screens/order_detail/order_detail.dart';
import 'package:client/screens/preferences/preferences.dart';
import 'package:client/screens/orders/orders.dart';
import 'package:client/screens/profile/profile.dart';
import 'package:client/screens/register/register.dart';
import 'package:client/screens/restaurant_details/restaurant_details.dart';
import 'package:client/screens/search/search.dart';
import 'package:client/screens/splash_screen/splash_screen.dart';
import 'package:common/page_builders/page_builders.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/payment_method/payment_method.dart';
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
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteName.splashScreen,
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        path: '/login',
        parentNavigatorKey: rootNavigatorKey,
        name: RouteName.login,
        pageBuilder: (context, state) =>
            const ModalBottomSheetPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/register',
        parentNavigatorKey: rootNavigatorKey,
        name: RouteName.register,
        pageBuilder: (context, state) =>
            const ModalBottomSheetPage(child: RegisterPage()),
      ),
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => HomeFormatPage(child: child),
          routes: [
            GoRoute(
                path: '/home',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.home,
                pageBuilder: (context, state) {
                  final categoryIds =
                      state.queryParameters['categoryIds']?.split(',');
                  final cuisineIds =
                      state.queryParameters['cuisineIds']?.split(',');
                  final menuIds = state.queryParameters['menuIds']?.split(',');

                  return NoTransitionPage(
                    child: HomePage(
                        categoryIds: categoryIds,
                        cuisineIds: cuisineIds,
                        menuIds: menuIds),
                  );
                },
                routes: [
                  menuPreferencesGoRoute(RouteName.menuPreferencesHome),
                  preferencesGoRoute(RouteName.preferencesHome),
                  GoRoute(
                      path: 'search',
                      parentNavigatorKey: rootNavigatorKey,
                      name: RouteName.search,
                      pageBuilder: (context, state) {
                        final categoryIds =
                            state.queryParameters['categoryIds']?.split(',');
                        final cuisineIds =
                            state.queryParameters['cuisineIds']?.split(',');
                        final menuIds =
                            state.queryParameters['menuIds']?.split(',');
                        final searchInput =
                            state.queryParameters['searchInput'];

                        return NoTransitionPage(
                            child: SearchPage(
                                categoryIds: categoryIds,
                                cuisineIds: cuisineIds,
                                menuIds: menuIds,
                                searchInput: searchInput));
                      },
                      routes: [
                        restaurantGoRoute(RouteName.searchRestaurantDetails,
                            RouteName.searchRestaurantFoodDetails),
                        filterRestaurantGoRoute(
                            RouteName.searchRestaurantFilter)
                      ]),
                  filterRestaurantGoRoute(RouteName.homeRestaurantFilter),
                  restaurantGoRoute(RouteName.homeRestaurantDetails,
                      RouteName.homeRestaurantFoodDetails),
                ]),
            GoRoute(
                path: '/favorites',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.favorites,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: FavoritesPage()),
                routes: [
                  filterRestaurantGoRoute(RouteName.favoriteRestaurantFilter),
                  restaurantGoRoute(RouteName.favoriteRestaurantDetails,
                      RouteName.favoriteRestaurantFoodDetails)
                ]),
            GoRoute(
                path: '/cart',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.cart,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CartPage()),
                routes: [
                  restaurantGoRoute(RouteName.cartRestaurantDetails,
                      RouteName.cartRestaurantFoodDetails),
                  GoRoute(
                      path: 'order_confirmation',
                      parentNavigatorKey: rootNavigatorKey,
                      name: RouteName.orderConfirmation,
                      builder: (context, state) =>
                          const OrderConfirmationPage(),
                      routes: [
                        // loginGoRoute(RouteName.loginOrderConfirmation),
                        // registerGoRoute(RouteName.registerOrderConfirmation),
                        GoRoute(
                            path: 'payment_method',
                            parentNavigatorKey: rootNavigatorKey,
                            name: RouteName.paymentMethod,
                            builder: (context, state) =>
                                const PaymentMethodPage()),
                      ])
                ]),
            GoRoute(
              path: '/profile',
              parentNavigatorKey: shellNavigatorKey,
              name: RouteName.profile,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()),
            ),
            GoRoute(
                path: '/orders',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.orders,
                builder: (context, state) => const OrdersPage(),
                routes: [
                  GoRoute(
                    path: ':orderId',
                    parentNavigatorKey: shellNavigatorKey,
                    name: RouteName.orderDetail,
                    builder: (context, state) => OrderDetailPage(
                      orderId: state.pathParameters['orderId'].toString(),
                    ),
                  ),
                ]),
          ]),
    ],
    redirect: (context, GoRouterState state) {
      final authState = userService.authenticationState;

      // final isGoingToUserPreferences =
      //     state.matchedLocation == '/home/preferences';
      final isGoingToSplash = state.matchedLocation == '/splash';

      // final isGoingToUnauthentication =
      //     isGoingToUserPreferences || isGoingToSplash;

      switch (authState.status) {
        case AuthenticationStatus.authenticated:
          if (isGoingToSplash) {
            return '/home';
          }
        // final userState = userService.userState;
        // switch (userState.status) {
        //   case UserStatus.success:
        //     // final user = userState.user;
        //     if (isGoingToUserPreferences) {
        //       return '/home';
        //     }
        //   case UserStatus.loading:
        //     break;
        //   case UserStatus.failure:
        //     break;
        // }
        case AuthenticationStatus.unauthenticated:
          break;
      }
      return null;
    },
  );

  GoRoute menuPreferencesGoRoute(String preferencesName) {
    return GoRoute(
      path: 'menu_preferences',
      parentNavigatorKey: rootNavigatorKey,
      name: RouteName.menuPreferencesHome,
      pageBuilder: (context, state) =>
          const ModalBottomSheetPage(child: MenuPreferencesPage()),
    );
  }

  GoRoute preferencesGoRoute(String preferencesName) {
    return GoRoute(
      path: 'preferences',
      parentNavigatorKey: rootNavigatorKey,
      name: preferencesName,
      pageBuilder: (context, state) {
        final isInit = (state.extra as bool?) ?? true;
        return ModalBottomSheetPage(
            enableDrag: isInit ? false : true,
            isDismissible: isInit ? false : true,
            child: const PreferencesPage());
      },
    );
  }

  GoRoute filterRestaurantGoRoute(String filterName) {
    return GoRoute(
      path: 'filter',
      parentNavigatorKey: rootNavigatorKey,
      name: filterName,
      pageBuilder: (context, state) {
        final categoryIds = state.queryParameters['categoryIds']?.split(',');
        final cuisineIds = state.queryParameters['cuisineIds']?.split(',');
        final menuIds = state.queryParameters['menuIds']?.split(',');

        return ModalBottomSheetPage(
            child: FilterRestaurantPage(
                categoryIds: categoryIds,
                cuisineIds: cuisineIds,
                menuIds: menuIds));
      },
    );
  }

  GoRoute restaurantGoRoute(String restaurantName, String foodRouteName) {
    return GoRoute(
      path: 'restaurant/:restaurantId',
      parentNavigatorKey: rootNavigatorKey,
      name: restaurantName,
      builder: (context, state) => RestaurantDetailsPage(
        restaurantId: state.pathParameters['restaurantId'].toString(),
        foodRouteName: foodRouteName,
      ),
      routes: [
        foodGoRoute(foodRouteName),
      ],
    );
  }

  GoRoute foodGoRoute(String foodRouteName, {bool? isSingle}) {
    return GoRoute(
        path: 'food/:foodId',
        parentNavigatorKey: rootNavigatorKey,
        name: foodRouteName,
        builder: (context, state) => FoodDetailsPage(
              restaurantId: state.pathParameters['restaurantId'].toString(),
              foodId: state.pathParameters['foodId'].toString(),
            ));
  }
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
