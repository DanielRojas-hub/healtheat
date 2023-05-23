import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../router/routes.dart';

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
            // case 1:
            //   context.goNamed(RouteName.favorites);
            //   break;
            case 1:
              context.goNamed(RouteName.cart);
              break;
            // case 2:
            //   context.goNamed(RouteName.profile);
            //   break;
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
          // SalomonBottomBarItem(
          //   icon: const Icon(Icons.favorite_border),
          //   title: const Text("Favorites"),
          //   selectedColor: Colors.pink,
          // ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          // SalomonBottomBarItem(
          //   icon: const Icon(Icons.person),
          //   title: const Text("Profile"),
          //   selectedColor: Colors.teal,
          // ),
        ],
      ),
    );
  }
}
