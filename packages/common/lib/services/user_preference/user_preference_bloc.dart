import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/services/user/user_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_preference_repository/user_preference_repository.dart';

part 'user_preference_event.dart';
part 'user_preference_state.dart';

class UserPreferenceBloc
    extends Bloc<UserPreferenceEvent, UserPreferenceState> {
  UserPreferenceBloc({UserPreferenceRepository? userPreferenceRepository})
      : _userPreferenceRepository =
            userPreferenceRepository ?? UserPreferenceRepository(),
        super(UserPreferenceLoading()) {
    on<GetUserPreference>(_onGetUserPreference);
    on<GetUserPreferences>(_onGetUserPreferences);
    on<StreamUserPreference>(_onStreamUserPreference);
    on<StreamUserPreferences>(_onStreamUserPreferences);
    on<UserBlocUserPreference>(_onUserBlocUserPreference);
    on<_UserPreferenceUpdated>(_onUserPreferenceUpdated);
    on<_UserPreferencesUpdated>(_onUserPreferencesUpdated);
  }

  final UserPreferenceRepository _userPreferenceRepository;

  StreamSubscription? _userPreferenceSubscription;
  StreamSubscription? _blocSubscription;

  @override
  Future<void> close() {
    _userPreferenceSubscription?.cancel();
    _blocSubscription?.cancel();
    return super.close();
  }

  void _onStreamUserPreference(
      StreamUserPreference event, Emitter<UserPreferenceState> emit) {
    _userPreferenceSubscription?.cancel();
    try {
      if (event.userPreferenceId == null) return emit(UserPreferenceLoading());
      _userPreferenceSubscription = _userPreferenceRepository
          .streamUserPreference(event.userId, event.userPreferenceId!)
          .listen(
              (userPreference) => add(_UserPreferenceUpdated(userPreference)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetUserPreference(
      GetUserPreference event, Emitter<UserPreferenceState> emit) async {
    _userPreferenceSubscription?.cancel();
    try {
      add(_UserPreferenceUpdated(await _userPreferenceRepository
          .getUserPreference(event.userId, event.userPreferenceId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamUserPreferences(
      StreamUserPreferences event, Emitter<UserPreferenceState> emit) {
    _userPreferenceSubscription?.cancel();
    try {
      _userPreferenceSubscription = _userPreferenceRepository
          .streamUserPreferences(event.userId)
          .listen(
              (userPreference) => add(_UserPreferencesUpdated(userPreference)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetUserPreferences(
      GetUserPreferences event, Emitter<UserPreferenceState> emit) async {
    _userPreferenceSubscription?.cancel();
    try {
      add(_UserPreferencesUpdated(
          await _userPreferenceRepository.getUserPreferences(event.userId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onUserBlocUserPreference(
      UserBlocUserPreference event, Emitter<UserPreferenceState> emit) {
    try {
      final userBloc = event.userBloc;
      _blocSubscription = userBloc.stream.listen((state) {
        if (state.user.isNotEmpty) {
          final user = state.user;
          add(StreamUserPreference(user.id, user.userPreferenceId));
        }
      });
      if (userBloc.state.user.isNotEmpty) {
        final user = userBloc.state.user;
        add(StreamUserPreference(user.id, user.userPreferenceId));
      }
    } catch (_) {
      //TODO: catch
    }
  }

  void _onUserPreferenceUpdated(
      _UserPreferenceUpdated event, Emitter<UserPreferenceState> emit) {
    return emit(UserPreferenceLoaded(event.userPreference));
  }

  void _onUserPreferencesUpdated(
      _UserPreferencesUpdated event, Emitter<UserPreferenceState> emit) {
    return emit(UserPreferencesLoaded(event.userPreferences));
  }
}
