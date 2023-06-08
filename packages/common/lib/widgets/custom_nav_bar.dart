// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';

import 'base_card.dart';

class NavBarItem {
  final IconData icon;
  final IconData? iconDisable;
  final String routeName;

  NavBarItem(this.icon, this.routeName, {this.iconDisable});
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {Key? key,
      required this.navList,
      required this.onTap,
      required this.index})
      : super(key: key);

  final List<NavBarItem> navList;
  final void Function(NavBarItem selectedNav) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Stack(children: [
          Row(
              children: List.generate(navList.length, (i) {
            final nav = navList[i];
            final isSelected = navList[index] == nav;
            return CustomNavBarSection(
                navList: navList,
                nav: nav,
                onTap: onTap,
                isSelected: isSelected);
          })),
          AnimatedContainer(
            duration: Constants.duration,
            alignment: Alignment(-1 + index * (2 / (navList.length - 1)), 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 12),
                Container(
                  height: 3,
                  width:
                      (MediaQuery.of(context).size.width / navList.length) - 26,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(Constants.radiusInfinite))),
                ),
                const SizedBox(width: 12),
              ],
            ),
          )
        ])
      ]),
    );
  }
}

class CustomNavBarSection extends StatelessWidget {
  const CustomNavBarSection(
      {Key? key,
      required this.nav,
      required this.isSelected,
      required this.onTap,
      required this.navList})
      : super(key: key);

  final List<NavBarItem> navList;
  final NavBarItem nav;
  final void Function(NavBarItem selectedNav) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCard(
        onTap: () => onTap(nav),
        elevation: 0,
        borderRadius: BorderRadius.zero,
        width: (MediaQuery.of(context).size.width / navList.length) - 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Column(children: [
            Icon(
              isSelected ? nav.icon : nav.iconDisable ?? nav.icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
          ]),
        ),
      ),
    );
  }
}
