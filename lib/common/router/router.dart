import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/client/cart/cart.dart';
import 'package:healtheat/client/favorites/favorites.dart';
import 'package:healtheat/client/filter_restaurant/filter_restaurant.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/client/login/login.dart';
import 'package:healtheat/client/order_confirmation/order_confirmation.dart';
import 'package:healtheat/client/order_detail/order_detail.dart';
import 'package:healtheat/client/preferences_filter/preferences_filter.dart';
import 'package:healtheat/client/profile/profile.dart';
import 'package:healtheat/client/register/register.dart';
import 'package:healtheat/client/restaurant_details/view/restaurant_details_page.dart';
import 'package:healtheat/client/food_details/food_detail.dart';
import 'package:healtheat/client/search/search.dart';
import 'package:healtheat/common/format/home_format/home_format.dart';
import 'package:healtheat/common/page_builders/modal_bottom_sheet.dart';
import 'package:healtheat/common/router/routes.dart';

import '../../restaurant/add_food/pages/information/information.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/add_food',
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
      GoRoute(
          path: '/add_food',
          name: RouteName.addFoodRestaurant,
          builder: (context, state) => const InformationPage()),
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => HomeFormatPage(child: child),
          routes: [
            GoRoute(
                path: '/home',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.home,
                /* builder: (context, state) => const HomePage(), */
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
                routes: [
                  filterRestaurantGoRoute(RouteName.homeRestaurantFilter),
                  restaurantGoRoute(RouteName.homeRestaurantDetails,
                      RouteName.homeRestaurantFoodDetails),
                ]),
            GoRoute(
                path: '/search',
                parentNavigatorKey: shellNavigatorKey,
                name: RouteName.search,
                /* builder: (context, state) => const SearchPage(), */
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
                /* builder: (context, state) => const FavoritesPage(), */
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
                /* builder: (context, state) => const CartPage(), */
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
              /* builder: (context, state) => const ProfilePage(), */
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
