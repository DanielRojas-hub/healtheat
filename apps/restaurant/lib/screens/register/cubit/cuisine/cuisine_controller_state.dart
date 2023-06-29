part of 'cuisine_controller_cubit.dart';

final class CuisineControllerState extends Equatable {
  final List<String> cuisineIds;

  const CuisineControllerState({List<String>? cuisineIds = const []})
      : cuisineIds = cuisineIds ?? const [];

  @override
  List<Object?> get props => [cuisineIds];
}
