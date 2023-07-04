import 'package:flutter/material.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:common/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';

final List<NavBarItem> navList = [
  NavBarItem(Ionicons.home, RouteName.home, iconDisable: Ionicons.home_outline),
  NavBarItem(Ionicons.fast_food, RouteName.menu,
      iconDisable: Ionicons.fast_food_outline)
];
