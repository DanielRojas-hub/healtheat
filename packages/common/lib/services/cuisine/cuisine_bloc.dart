import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cuisine_repository/cuisine_repository.dart';
import 'package:equatable/equatable.dart';

part 'cuisine_event.dart';
part 'cuisine_state.dart';

class CuisineBloc extends Bloc<CuisineEvent, CuisineState> {
  CuisineBloc({CuisineRepository? cuisineRepository})
      : _cuisineRepository = cuisineRepository ?? CuisineRepository(),
        super(CuisineLoading()) {
    on<StreamCuisine>(_onStreamCuisine);
    on<GetCuisine>(_onGetCuisine);
    on<StreamCuisines>(_onStreamCuisines);
    on<GetCuisines>(_onGetCuisines);
    on<_CuisineUpdated>(_onCuisineUpdated);
    on<_CuisinesUpdated>(_onCuisinesUpdated);
  }

  final CuisineRepository _cuisineRepository;

  StreamSubscription? _cuisineSubscription;

  @override
  Future<void> close() {
    _cuisineSubscription?.cancel();
    return super.close();
  }

  void _onStreamCuisine(StreamCuisine event, Emitter<CuisineState> emit) {
    _cuisineSubscription?.cancel();
    try {
      _cuisineSubscription = _cuisineRepository
          .streamCuisine(event.cuisineId)
          .listen((cuisine) => add(_CuisineUpdated(cuisine)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetCuisine(
      GetCuisine event, Emitter<CuisineState> emit) async {
    _cuisineSubscription?.cancel();
    try {
      add(_CuisineUpdated(
          await _cuisineRepository.getCuisine(event.cuisineId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamCuisines(StreamCuisines event, Emitter<CuisineState> emit) {
    _cuisineSubscription?.cancel();
    try {
      _cuisineSubscription = _cuisineRepository
          .streamCuisines()
          .listen((cuisines) => add(_CuisinesUpdated(cuisines)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetCuisines(
      GetCuisines event, Emitter<CuisineState> emit) async {
    _cuisineSubscription?.cancel();
    try {
      // if (event.restaurantId.isEmpty) return emit(const FoodsLoaded([]));
      add(_CuisinesUpdated(
        await _cuisineRepository.getCuisines(),
      ));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onCuisineUpdated(_CuisineUpdated event, Emitter<CuisineState> emit) {
    return emit(CuisineLoaded(event.cuisine));
  }

  void _onCuisinesUpdated(_CuisinesUpdated event, Emitter<CuisineState> emit) {
    return emit(CuisinesLoaded(event.cuisines));
  }
}
