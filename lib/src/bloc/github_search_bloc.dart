import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_package/src/bloc/github_search_state.dart';
import 'package:github_package/src/github_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'github_search_event.dart';

const _debounceTime = Duration(milliseconds: 500);
EventTransformer<Event> debounceEffect<Event>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({
    required this.repository,
  }) : super(GithubSearchState.initial()) {
    on<TextChangedEvent>(_onTextChanged,
        transformer: debounceEffect(_debounceTime));
  }

  final GithubRepository repository;

  FutureOr<void> _onTextChanged(
      TextChangedEvent event, Emitter<GithubSearchState> emit) {
    if (event.query.isEmpty) {
      emit(GithubSearchState.initial());
    } else {
      emit(GithubSearchState.loading());
      repository.searchItems(event.query).then((value) {
        emit(GithubSearchState.success(items: value.items));
      }).catchError((error) {
        emit(GithubSearchState.failure(message: error.toString()));
      });
    }
  }
}
