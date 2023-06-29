part of 'petition_bloc.dart';

abstract class PetitionState extends Equatable {
  const PetitionState();

  @override
  List<Object> get props => [];
}

class PetitionLoading extends PetitionState {}

class PetitionFailure extends PetitionState {}

class PetitionLoaded extends PetitionState {
  final Petition petition;

  const PetitionLoaded(this.petition);

  @override
  List<Object> get props => [petition];
}

class PetitionsLoaded extends PetitionState {
  final List<Petition> petitions;

  const PetitionsLoaded(this.petitions);

  @override
  List<Object> get props => [petitions];
}
