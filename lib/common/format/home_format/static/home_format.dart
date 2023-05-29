import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/widgets/custom_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

final List<CustomNavBarItem> navList = [
  CustomNavBarItem(Ionicons.home, RouteName.home,
      iconDisable: Ionicons.home_outline),
  CustomNavBarItem(Ionicons.heart, RouteName.favorites,
      iconDisable: Ionicons.heart_outline),
  CustomNavBarItem(Ionicons.cart, RouteName.cart,
      iconDisable: Ionicons.cart_outline),
  CustomNavBarItem(Ionicons.person, RouteName.profile,
      iconDisable: Ionicons.person_outline),
];
