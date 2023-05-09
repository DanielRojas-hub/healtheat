part of 'tab_cubit.dart';

class TabState extends Equatable {
  const TabState({required this.selectedTab});

  final tab.Tab selectedTab;

  @override
  List<Object> get props => [selectedTab];
}
