part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class TextChange extends SearchEvent {
  final String searchInput;

  const TextChange(this.searchInput);

  @override
  List<Object> get props => [searchInput];
}
