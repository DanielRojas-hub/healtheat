import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState(searchInput: '')) {
    on<TextChange>(_onTextChange);
  }

  void _onTextChange(TextChange event, Emitter<SearchState> emit) async {
    emit(SearchState(searchInput: event.searchInput));
  }
}
