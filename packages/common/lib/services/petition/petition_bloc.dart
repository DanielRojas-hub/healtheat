import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petition_repository/petition_repository.dart';

part 'petition_event.dart';
part 'petition_state.dart';

class PetitionBloc extends Bloc<PetitionEvent, PetitionState> {
  PetitionBloc({PetitionRepository? petitionRepository})
      : _petitionRepository = petitionRepository ?? PetitionRepository(),
        super(PetitionLoading()) {
    on<StreamPetition>(_onStreamPetition);
    on<GetPetition>(_onGetPetition);
    on<StreamPetitions>(_onStreamPetitions);
    on<GetPetitions>(_onGetPetitions);
    on<_PetitionUpdated>(_onPetitionUpdated);
    on<_PetitionsUpdated>(_onPetitionsUpdated);
  }

  final PetitionRepository _petitionRepository;

  StreamSubscription? _blocSubscription;
  StreamSubscription? _petitionSubscription;

  @override
  Future<void> close() {
    _blocSubscription?.cancel();
    _petitionSubscription?.cancel();
    return super.close();
  }

  void _onStreamPetition(StreamPetition event, Emitter<PetitionState> emit) {
    _petitionSubscription?.cancel();
    try {
      _petitionSubscription = _petitionRepository
          .streamPetition(event.petitionId)
          .listen((petition) => add(_PetitionUpdated(petition)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetPetition(
      GetPetition event, Emitter<PetitionState> emit) async {
    _petitionSubscription?.cancel();
    try {
      add(_PetitionUpdated(await _petitionRepository.getPetition(
          event.petitionId, event.orderId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamPetitions(StreamPetitions event, Emitter<PetitionState> emit) {
    _petitionSubscription?.cancel();
    try {
      if (event.orderId.isEmpty) return emit(const PetitionsLoaded([]));
      _petitionSubscription = _petitionRepository
          .streamPetitions(event.orderId, petitionIds: event.petitionIds)
          .listen((Petitions) => add(_PetitionsUpdated(Petitions)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetPetitions(
      GetPetitions event, Emitter<PetitionState> emit) async {
    _petitionSubscription?.cancel();
    try {
      if (event.orderId.isEmpty) return emit(const PetitionsLoaded([]));
      add(_PetitionsUpdated(await _petitionRepository
          .getPetitions(event.orderId, petitionIds: event.petitionIds)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onPetitionUpdated(_PetitionUpdated event, Emitter<PetitionState> emit) {
    return emit(PetitionLoaded(event.petition));
  }

  void _onPetitionsUpdated(
      _PetitionsUpdated event, Emitter<PetitionState> emit) {
    return emit(PetitionsLoaded(event.petitions));
  }
}
