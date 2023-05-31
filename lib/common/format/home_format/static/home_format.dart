import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/widgets/custom_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

final List<NavBarItem> navList = [
  NavBarItem(Ionicons.home, RouteName.home, iconDisable: Ionicons.home_outline),
  NavBarItem(Ionicons.heart, RouteName.favorites,
      iconDisable: Ionicons.heart_outline),
  NavBarItem(Ionicons.cart, RouteName.cart, iconDisable: Ionicons.cart_outline),
  NavBarItem(Ionicons.person, RouteName.profile,
      iconDisable: Ionicons.person_outline),
];
