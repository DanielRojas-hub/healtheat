import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cuisine_controller_state.dart';

class CuisineControllerCubit extends Cubit<CuisineControllerState> {
  CuisineControllerCubit() : super(const CuisineControllerState());

  void addCuisine(String cuisineId) {
    final List<String> cuisineIds = List.from(state.cuisineIds);
    cuisineIds.add(cuisineId);
    emit(CuisineControllerState(cuisineIds: cuisineIds));
  }

  void removeCuisine(String cuisineId) {
    final List<String> cuisineIds = List.from(state.cuisineIds);
    cuisineIds.remove(cuisineId);
    emit(CuisineControllerState(cuisineIds: cuisineIds));
  }
}
