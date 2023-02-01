import 'package:github_package/src/model/search_result_item.dart';

typedef SearchResultMap = Map<String, dynamic>;

class SearchResult {
  final List<SearchResultItem> items;

  SearchResult({required this.items});

  factory SearchResult.fromJson(SearchResultMap json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => SearchResultItem.fromJson(e))
        .toList();
    return SearchResult(items: items);
  }
}
