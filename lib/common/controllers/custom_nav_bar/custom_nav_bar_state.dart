part of 'custom_nav_bar_cubit.dart';

class CustomNavBarState extends Equatable {
  const CustomNavBarState(
      {required this.selectedNav,
      required this.navList,
      required this.position});

  final CustomNavBarItem selectedNav;
  final List<CustomNavBarItem> navList;
  final int position;

  @override
  List<Object> get props => [selectedNav, navList, position];
}
