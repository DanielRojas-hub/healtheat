import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';

class TabElement extends Equatable {
  final String title;

  const TabElement(this.title);

  @override
  List<Object?> get props => [title];
}

class CustomTabNav extends StatelessWidget {
  const CustomTabNav(
      {Key? key,
      required this.tabList,
      required this.onTap,
      required this.selectedIndex})
      : super(key: key);

  final List<TabElement> tabList;
  final void Function(TabElement selectedTab) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
      child: SizedBox(
        height: 30,
        child: Stack(children: [
          Row(
            children: List.generate(tabList.length, (index) {
              final tab = tabList[index];
              final isSelected = tabList[selectedIndex] == tab;
              return Expanded(
                child: CustomTabSelection(
                    tab: tab, isSelected: isSelected, onTap: onTap),
              );
            }),
          ),
          AnimatedContainer(
            duration: Constants.duration,
            alignment:
                Alignment(-1 + selectedIndex * (2 / (tabList.length - 1)), 1),
            child: Container(
              height: 3,
              width: (MediaQuery.of(context).size.width / tabList.length) -
                  Constants.margin,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Constants.radiusInfinite))),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomTabSelection extends StatelessWidget {
  const CustomTabSelection(
      {Key? key,
      required this.tab,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final TabElement tab;
  final bool isSelected;
  final void Function(TabElement selectedTab) onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      backgroundColor: Colors.transparent,
      onTap: () => onTap(tab),
      child: Text(
        tab.title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected
                ? Theme.of(context).primaryColor
                : context.theme.blackColor),
      ),
    );
  }
}
