import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:menu_repository/menu_repository.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({MenuRepository? menuRepository})
      : _menuRepository = menuRepository ?? MenuRepository(),
        super(MenuLoading()) {
    on<StreamMenu>(_onStreamMenu);
    on<GetMenu>(_onGetMenu);
    on<StreamMenus>(_onStreamMenus);
    on<GetMenus>(_onGetMenus);
    on<_MenuUpdated>(_onMenuUpdated);
    on<_MenusUpdated>(_onMenusUpdated);
  }

  final MenuRepository _menuRepository;

  StreamSubscription? _menuSubscription;

  @override
  Future<void> close() {
    _menuSubscription?.cancel();
    return super.close();
  }

  void _onStreamMenu(StreamMenu event, Emitter<MenuState> emit) {
    _menuSubscription?.cancel();
    try {
      // if (event.categoryId.isEmpty) return;
      _menuSubscription = _menuRepository
          .streamMenu(event.menuId)
          .listen((menu) => add(_MenuUpdated(menu)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetMenu(GetMenu event, Emitter<MenuState> emit) async {
    _menuSubscription?.cancel();
    try {
      add(_MenuUpdated(await _menuRepository.getMenu(event.menuId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamMenus(StreamMenus event, Emitter<MenuState> emit) {
    _menuSubscription?.cancel();
    try {
      _menuSubscription = _menuRepository
          .streamMenus()
          .listen((menus) => add(_MenusUpdated(menus)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetMenus(GetMenus event, Emitter<MenuState> emit) async {
    _menuSubscription?.cancel();
    try {
      // if (event.restaurantId.isEmpty) return emit(const FoodsLoaded([]));
      add(_MenusUpdated(
        await _menuRepository.getMenus(),
      ));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onMenuUpdated(_MenuUpdated event, Emitter<MenuState> emit) {
    return emit(MenuLoaded(event.menu));
  }

  void _onMenusUpdated(_MenusUpdated event, Emitter<MenuState> emit) {
    return emit(MenusLoaded(event.menus));
  }
}
