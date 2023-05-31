part of 'tab_cubit.dart';

class TabState extends Equatable {
  const TabState({required this.tabList, required this.selectedIndex});

  final List<TabElement> tabList;
  final int selectedIndex;

  @override
  List<Object> get props => [tabList, selectedIndex];
}
