import 'package:client/format/home_format/home_format.dart';
import 'package:client/screens/cart/cart.dart';
import 'package:client/screens/favorites/favorites.dart';
import 'package:client/screens/filter_restaurant/filter_restaurant.dart';
import 'package:client/screens/food_details/food_detail.dart';
import 'package:client/screens/home/home.dart';
import 'package:client/screens/login/login.dart';
import 'package:client/screens/order_confirmation/order_confirmation.dart';
import 'package:client/screens/order_detail/order_detail.dart';
import 'package:client/screens/preferences_filter/preferences_filter.dart';
import 'package:client/screens/profile/profile.dart';
import 'package:client/screens/register/register.dart';
import 'package:client/screens/restaurant_details/restaurant_details.dart';
import 'package:client/screens/search/search.dart';
import 'package:common/page_builders/page_builders.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_name.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      // GoRoute(
      //     path: '/splash_screen',
      //     name: RouteName.splashScreen,
      //     builder: (context, state) => const SplashScreenPage()),
      GoRoute(
          path: '/preferences_filter',
          name: RouteName.preferencesFilter,
          builder: (context, state) => const PreferencesFilterPage()),
      GoRoute(
          path: '/register',
          name: RouteName.register,
          builder: (context, state) => const RegisterPage()),
      GoRoute(
          path: '/login',
          name: RouteName.login,
          builder: (context, state) => const LoginPage()),
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => HomeFormatPage(child: child),
          routes: [
            GoRoute(
                path: '/home',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.home,
                pageBuilder: (context, state) {
                  final categories =
                      state.queryParameters['categories']?.split(',');
                  final cuisines =
                      state.queryParameters['cuisines']?.split(',');
                  final menus = state.queryParameters['menus']?.split(',');

                  return NoTransitionPage(
                    child: HomePage(
                        categories: categories,
                        cuisines: cuisines,
                        menus: menus),
                  );
                },
                routes: [
                  filterRestaurantGoRoute(RouteName.homeRestaurantFilter),
                  restaurantGoRoute(RouteName.homeRestaurantDetails,
                      RouteName.homeRestaurantFoodDetails),
                ]),
            GoRoute(
                path: '/search',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.search,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SearchPage()),
                routes: [
                  restaurantGoRoute(RouteName.searchRestaurantDetails,
                      RouteName.searchRestaurantFoodDetails),
                  filterRestaurantGoRoute(RouteName.searchRestaurantFilter)
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
                    builder: (context, state) => const OrderConfirmationPage(),
                  )
                ]),
            GoRoute(
              path: '/profile',
              parentNavigatorKey: shellNavigatorKey,
              name: RouteName.profile,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()),
            ),
          ]),
      GoRoute(
        path: '/order_detail',
        parentNavigatorKey: rootNavigatorKey,
        name: RouteName.orderDetail,
        builder: (context, state) => OrderDetailPage(
          restaurantId: state.pathParameters['restaurantId'].toString(),
          orderId: state.pathParameters['orderId'].toString(),
        ),
      ),
    ],
  );

  GoRoute filterRestaurantGoRoute(String filterName) {
    return GoRoute(
      path: 'filter',
      parentNavigatorKey: rootNavigatorKey,
      name: filterName,
      pageBuilder: (context, state) {
        final categories = state.queryParameters['categories']?.split(',');
        final cuisines = state.queryParameters['cuisines']?.split(',');
        final menus = state.queryParameters['menus']?.split(',');

        return ModalBottomSheetPage(
            child: FilterRestaurantPage(
                categories: categories, cuisines: cuisines, menus: menus));
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
