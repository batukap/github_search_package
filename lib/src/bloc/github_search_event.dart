part of 'github_search_bloc.dart';

abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();
}

class TextChangedEvent extends GithubSearchEvent {
  final String query;

  const TextChangedEvent({required this.query});

  @override
  List<Object?> get props => [];
}
