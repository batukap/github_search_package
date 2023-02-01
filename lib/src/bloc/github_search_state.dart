import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_package/src/model/search_result.dart';

part 'github_search_state.freezed.dart';

@freezed
class GithubSearchState with _$GithubSearchState {
  const factory GithubSearchState.initial() = _GithubSearchStateInitial;
  const factory GithubSearchState.loading() = _GithubSearchStateLoading;
  const factory GithubSearchState.success({required List<SearchResult> items}) =
      _GithubSearchStateSuccess;
  const factory GithubSearchState.failure({required String message}) =
      _GithubSearchStateFailure;
}
