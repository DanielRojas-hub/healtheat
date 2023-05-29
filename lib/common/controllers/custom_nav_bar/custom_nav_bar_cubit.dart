import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_nav_bar.dart';

part 'custom_nav_bar_state.dart';

class CustomNavBarCubit extends Cubit<CustomNavBarState> {
  CustomNavBarCubit({required List<CustomNavBarItem> navList})
      : _navList = navList,
        super(CustomNavBarState(
            selectedNav: navList.first, navList: navList, position: 0));

  final List<CustomNavBarItem> _navList;

  bool _isAvailable = true;

  void onTap(CustomNavBarItem selectedNav) {
    if (_isAvailable) {
      _isAvailable = false;
      int position = 0;

      Future.delayed((Constants.duration), () => _isAvailable = true);

      _navList.asMap().forEach((key, value) {
        if (selectedNav == value) {
          position = key;
        }
      });

      return emit(CustomNavBarState(
          selectedNav: selectedNav, navList: _navList, position: position));
    }
  }
}
