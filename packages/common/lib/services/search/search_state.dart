part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String input;
  const SearchState({required this.input});

  @override
  List<Object?> get props => [input];
}
