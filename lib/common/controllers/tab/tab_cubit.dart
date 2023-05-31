import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_tab.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit({required List<TabElement> tabList, PageController? controller})
      : _tabList = tabList,
        controller = controller ?? PageController(initialPage: 0),
        super(TabState(tabList: tabList, selectedIndex: 0));

  final List<TabElement> _tabList;
  final PageController controller;

  bool _isAvailable = true;

  void onPageChanged(int index) {
    if (_isAvailable) {
      return emit(TabState(tabList: _tabList, selectedIndex: index));
    }
  }

  void onTap(TabElement selectedTab) {
    if (_isAvailable) {
      int selectedIndex = 0;
      _isAvailable = false;

      _tabList.asMap().forEach((index, value) {
        if (selectedTab == value) {
          selectedIndex = index;
        }
      });

      controller.animateToPage(selectedIndex,
          curve: Constants.curve, duration: Constants.duration);
      Future.delayed((Constants.duration), () => _isAvailable = true);

      return emit(TabState(tabList: _tabList, selectedIndex: selectedIndex));
    }
  }
}
