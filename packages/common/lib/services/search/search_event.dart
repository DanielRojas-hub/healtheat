part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class TextChange extends SearchEvent {
  final String input;

  const TextChange(this.input);

  @override
  List<Object> get props => [input];
}
