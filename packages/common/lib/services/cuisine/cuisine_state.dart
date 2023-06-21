part of 'cuisine_bloc.dart';

abstract class CuisineState extends Equatable {
  const CuisineState();

  @override
  List<Object> get props => [];
}

class CuisineLoading extends CuisineState {}

class CuisineFailure extends CuisineState {}

class CuisineLoaded extends CuisineState {
  final Cuisine cuisine;

  const CuisineLoaded(this.cuisine);

  @override
  List<Object> get props => [cuisine];
}

class CuisinesLoaded extends CuisineState {
  final List<Cuisine> cuisines;

  const CuisinesLoaded(this.cuisines);

  @override
  List<Object> get props => [cuisines];
}
