import 'model/search_result.dart';

class GithubCache {
  final _cache = <String, SearchResult>{};

  SearchResult? get(String param) => _cache[param];

  void set(String param, SearchResult result) => _cache[param] = result;
  bool contains(String param) => _cache.containsKey(param);
  void remove(String param) => _cache.remove(param); 
}
