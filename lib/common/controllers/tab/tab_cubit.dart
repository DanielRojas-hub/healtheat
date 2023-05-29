import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/tab_widget.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit({required List<TabElement> tabList, PageController? controller})
      : _tabList = tabList,
        controller = controller ?? PageController(initialPage: 0),
        super(TabState(tabList: tabList, selectedTab: tabList.first));

  final List<TabElement> _tabList;
  final PageController controller;

  bool _isAvailable = true;

  void onPageChanged(int index) {
    if (_isAvailable) {
      final selectedTab = _tabList[index];

      return emit(TabState(tabList: _tabList, selectedTab: selectedTab));
    }
  }

  void onTap(TabElement selectedTab) {
    if (_isAvailable) {
      int index = 0;
      _isAvailable = false;

      _tabList.asMap().forEach((key, value) {
        if (selectedTab == value) {
          index = key;
        }
      });

      controller.animateToPage(index,
          curve: Constants.curve, duration: Constants.duration);
      Future.delayed((Constants.duration), () => _isAvailable = true);

      return emit(TabState(tabList: _tabList, selectedTab: selectedTab));
    }
  }
}
