part of 'custom_nav_bar_cubit.dart';

class CustomNavBarState extends Equatable {
  const CustomNavBarState({required this.navList, required this.index});

  final List<NavBarItem> navList;
  final int index;

  @override
  List<Object> get props => [navList, index];
}
