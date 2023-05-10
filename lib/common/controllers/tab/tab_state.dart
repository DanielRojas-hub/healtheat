part of 'tab_cubit.dart';

class TabState extends Equatable {
  const TabState({required this.selectedTab});

  final TabElement selectedTab;

  @override
  List<Object> get props => [selectedTab];
}
