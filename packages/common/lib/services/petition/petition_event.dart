// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'petition_bloc.dart';

abstract class PetitionEvent extends Equatable {
  const PetitionEvent();

  @override
  List<Object?> get props => [];
}

class StreamPetition extends PetitionEvent {
  final String orderId;
  final String petitionId;

  const StreamPetition(this.orderId, this.petitionId);

  @override
  List<Object> get props => [orderId, petitionId];
}

class GetPetition extends PetitionEvent {
  final String orderId;
  final String petitionId;

  const GetPetition(this.orderId, this.petitionId);

  @override
  List<Object> get props => [orderId, petitionId];
}

class StreamPetitions extends PetitionEvent {
  final String orderId;
  final List<String>? petitionIds;

  const StreamPetitions(this.orderId, {this.petitionIds});

  @override
  List<Object?> get props => [orderId, petitionIds];
}

class GetPetitions extends PetitionEvent {
  final String orderId;
  final List<String>? petitionIds;

  const GetPetitions(this.orderId, this.petitionIds);

  @override
  List<Object?> get props => [orderId, petitionIds];
}

class _PetitionUpdated extends PetitionEvent {
  final Petition petition;

  const _PetitionUpdated(this.petition);

  @override
  List<Object> get props => [petition];
}

class _PetitionsUpdated extends PetitionEvent {
  final List<Petition> petitions;

  const _PetitionsUpdated(this.petitions);

  @override
  List<Object> get props => [petitions];
}
