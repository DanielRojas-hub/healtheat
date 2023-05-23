import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/client/cart/cart.dart';
import 'package:healtheat/client/favorites/favorites.dart';
import 'package:healtheat/client/filter_restaurant/filter_restaurant.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/client/login/login.dart';
import 'package:healtheat/client/order_confirmation/order_confirmation.dart';
import 'package:healtheat/client/profile/profile.dart';
import 'package:healtheat/client/register/register.dart';
import 'package:healtheat/client/restaurant_details/view/restaurant_details_page.dart';
import 'package:healtheat/client/food_details/food_detail.dart';
import 'package:healtheat/client/search/search.dart';
import 'package:healtheat/client/splash_screen/splash_screen.dart';
import 'package:healtheat/common/page_builders/modal_bottom_sheet.dart';
import 'package:healtheat/common/router/routes.dart';

import '../../client/order_detail/view/order_detail_page.dart';
import '../format/home_format.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash_screen',
    routes: [
      GoRoute(
          path: '/splash_screen',
          name: RouteName.splashScreen,
          builder: (context, state) => const SplashScreenPage()),
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
          builder: (context, state, child) => HomeFormat(child: child),
          routes: [
            GoRoute(
                path: '/home',
                name: RouteName.home,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
                routes: [
                  filterRestaurantGoRoute(RouteName.homeRestaurantFilter),
                  restaurantGoRoute(RouteName.homeRestaurantDetails,
                      RouteName.homeRestaurantFoodDetails),
                ]),
            GoRoute(
                path: '/search',
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
              name: RouteName.profile,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()),
            ),
          ]),
      GoRoute(
        path: '/order_detail',
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
      pageBuilder: (context, state) =>
          const ModalBottomSheetPage(child: FilterRestaurantPage()),
    );
  }

  GoRoute restaurantGoRoute(String restaurantName, String foodName) {
    return GoRoute(
      path: 'restaurant/:restaurantId',
      parentNavigatorKey: rootNavigatorKey,
      name: restaurantName,
      builder: (context, state) => RestaurantDetailsPage(
        restaurantId: state.pathParameters['restaurantId'].toString(),
        foodName: foodName,
      ),
      routes: [
        foodGoRoute(foodName),
      ],
    );
  }

  GoRoute foodGoRoute(String foodName, {bool? isSingle}) {
    return GoRoute(
        path: 'food/:foodId',
        parentNavigatorKey: rootNavigatorKey,
        name: foodName,
        builder: (context, state) => FoodDetailsPage(
              restaurantId: state.pathParameters['restaurantId'].toString(),
              foodId: state.pathParameters['foodId'].toString(),
            ));
  }
}
