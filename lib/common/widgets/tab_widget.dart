import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';

import 'base_card.dart';

class TabElement extends Equatable {
  final String title;

  const TabElement(this.title);

  @override
  List<Object?> get props => [title];
}

class TabWidget extends StatelessWidget {
  const TabWidget(
      {Key? key,
      required this.tabList,
      required this.selectedTab,
      required this.onTap})
      : super(key: key);

  final List<TabElement> tabList;
  final TabElement selectedTab;
  final void Function(TabElement selectedTab) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(tabList.length, (index) {
      final tab = tabList[index];
      final isSelected = selectedTab == tab;
      final isFirst = index == 0;
      final isLast = index + 1 == tabList.length;

      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(
              left: !isFirst ? 8.0 : 0, right: !isLast ? 8.0 : 0),
          child:
              SelectionOption(tab: tab, isSelected: isSelected, onTap: onTap),
        ),
      );
    }));
  }
}

class SelectionOption extends StatelessWidget {
  const SelectionOption(
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
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    width: 2.5))),
        child: Center(
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
        ),
      ),
    );
  }
}
