part of 'tab_cubit.dart';

class TabState extends Equatable {
  const TabState({required this.tabList, required this.selectedTab});

  final TabElement selectedTab;
  final List<TabElement> tabList;

  @override
  List<Object> get props => [tabList, selectedTab];
}
