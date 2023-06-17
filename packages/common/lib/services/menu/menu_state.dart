part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuLoading extends MenuState {}

class MenuFailure extends MenuState {}

class MenuLoaded extends MenuState {
  final Menu menu;

  const MenuLoaded(this.menu);

  @override
  List<Object> get props => [menu];
}

class MenusLoaded extends MenuState {
  final List<Menu> menus;

  const MenusLoaded(this.menus);

  @override
  List<Object> get props => [menus];
}
