part of 'cuisine_bloc.dart';

abstract class CuisineEvent extends Equatable {
  const CuisineEvent();

  @override
  List<Object?> get props => [];
}

class StreamCuisine extends CuisineEvent {
  final String cuisineId;

  const StreamCuisine(this.cuisineId);

  @override
  List<Object> get props => [cuisineId];
}

class GetCuisine extends CuisineEvent {
  final String cuisineId;

  const GetCuisine(this.cuisineId);

  @override
  List<Object> get props => [cuisineId];
}

class StreamCuisines extends CuisineEvent {
  const StreamCuisines();

  @override
  List<Object?> get props => [];
}

class GetCuisines extends CuisineEvent {
  const GetCuisines();

  @override
  List<Object?> get props => [];
}

class _CuisineUpdated extends CuisineEvent {
  final Cuisine cuisine;

  const _CuisineUpdated(this.cuisine);

  @override
  List<Object> get props => [cuisine];
}

class _CuisinesUpdated extends CuisineEvent {
  final List<Cuisine> cuisines;

  const _CuisinesUpdated(this.cuisines);

  @override
  List<Object> get props => [cuisines];
}
