part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

class StreamMenu extends MenuEvent {
  final String menuId;

  const StreamMenu(this.menuId);

  @override
  List<Object> get props => [menuId];
}

class GetMenu extends MenuEvent {
  final String menuId;

  const GetMenu(this.menuId);

  @override
  List<Object> get props => [menuId];
}

class StreamMenus extends MenuEvent {
  const StreamMenus();

  @override
  List<Object?> get props => [];
}

class GetMenus extends MenuEvent {
  const GetMenus();

  @override
  List<Object?> get props => [];
}

class _MenuUpdated extends MenuEvent {
  final Menu menu;

  const _MenuUpdated(this.menu);

  @override
  List<Object> get props => [menu];
}

class _MenusUpdated extends MenuEvent {
  final List<Menu> menus;

  const _MenusUpdated(this.menus);

  @override
  List<Object> get props => [menus];
}
