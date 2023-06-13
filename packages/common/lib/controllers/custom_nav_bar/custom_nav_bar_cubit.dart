import 'package:bloc/bloc.dart';
import 'package:common/utils/constants.dart';
import 'package:common/widgets/custom_nav_bar.dart';
import 'package:equatable/equatable.dart';

part 'custom_nav_bar_state.dart';

class CustomNavBarCubit extends Cubit<CustomNavBarState> {
  CustomNavBarCubit({required List<NavBarItem> navList})
      : _navList = navList,
        super(CustomNavBarState(navList: navList, index: 0));

  final List<NavBarItem> _navList;

  bool _isAvailable = true;

  void onTap(NavBarItem selectedNav) {
    if (_isAvailable) {
      _isAvailable = false;
      int index = 0;

      Future.delayed((Constants.duration), () => _isAvailable = true);

      _navList.asMap().forEach((i, value) {
        if (selectedNav == value) {
          index = i;
        }
      });

      return emit(CustomNavBarState(navList: _navList, index: index));
    }
  }
}
