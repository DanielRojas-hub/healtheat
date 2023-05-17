import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/client/cart/cart.dart';
import 'package:healtheat/client/favorites/favorites.dart';
import 'package:healtheat/client/home/home.dart';
import 'package:healtheat/client/login/login.dart';
import 'package:healtheat/client/order_confirmation/order_confirmation.dart';
import 'package:healtheat/client/profile/profile.dart';
import 'package:healtheat/client/register/register.dart';
import 'package:healtheat/client/search/view/search_page.dart';
import 'package:healtheat/client/splash_screen/splash_screen.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/search',
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
            ),
            GoRoute(
              path: '/favorites',
              name: RouteName.favorites,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FavoritesPage()),
            ),
            GoRoute(
                path: '/search',
                name: RouteName.search,
                builder: (context, state) => const SearchPage()),
            GoRoute(
                path: '/cart',
                name: RouteName.cart,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CartPage()),
                routes: [
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
    ],
  );
}

class HomeFormat extends StatefulWidget {
  const HomeFormat({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeFormat> createState() => _HomeFormatState();
}

class _HomeFormatState extends State<HomeFormat> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.child,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          switch (index) {
            case 0:
              context.goNamed(RouteName.home);
              break;
            case 1:
              context.goNamed(RouteName.favorites);
              break;
            case 2:
              context.goNamed(RouteName.cart);
              break;
            case 3:
              context.goNamed(RouteName.profile);
              break;
          }
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Favorites"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
