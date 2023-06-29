import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

import '../services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(const UserState.loading()) {
    on<AuthenticationBlocUser>(_onAuthenticationBlocUser);
    on<ChangeFavoriteRestaurants>(_onChangeFavoriteRestaurants);
    on<ChangeFavoriteDishes>(_onChangeFavoriteDishes);
    on<UpdateUser>(_onUpdateUser);
    on<_AuthenticationUserBloc>(_onAuthenticationUserBloc);
    on<_UserUpdated>(_onUserUpdated);
  }

  final UserRepository _userRepository;

  StreamSubscription? _authUserSubscription;
  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }

  void _onAuthenticationBlocUser(
      AuthenticationBlocUser event, Emitter<UserState> emit) {
    _authUserSubscription?.cancel();
    try {
      _authUserSubscription = event.authenticationBloc.stream.listen(
        (state) => add(_AuthenticationUserBloc(state.authUser)),
      );
    } catch (_) {}
  }

  Future<void> _onChangeFavoriteRestaurants(
      ChangeFavoriteRestaurants event, Emitter<UserState> emit) async {
    print('a');
    final List<String> favRestaurants =
        List.from(state.user.favRestaurants ?? []);
    if (favRestaurants.contains(event.restaurantId)) {
      favRestaurants.remove(event.restaurantId);
    } else {
      favRestaurants.add(event.restaurantId);
    }
    add(UpdateUser(state.user, {'favRestaurants': favRestaurants}));
  }

  Future<void> _onChangeFavoriteDishes(
      ChangeFavoriteDishes event, Emitter<UserState> emit) async {
    final List<String> favFoods = List.from(state.user.favFoods ?? []);
    if (favFoods.contains(event.foodId)) {
      favFoods.remove(event.foodId);
    } else {
      favFoods.add(event.foodId);
    }
    add(UpdateUser(state.user, {'favFoods': favFoods}));
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    await _userRepository.updateUser(event.user, event.data);
  }

  void _onAuthenticationUserBloc(
      _AuthenticationUserBloc event, Emitter<UserState> emit) {
    _userSubscription?.cancel();

    if (event.authUser.isEmpty) return emit(const UserState.loading());

    try {
      _userSubscription = _userRepository
          .streamUser(event.authUser.id)
          .listen((user) => add(_UserUpdated(user)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onUserUpdated(_UserUpdated event, Emitter<UserState> emit) async {
    return emit(UserState.success(event.user));
  }
}
