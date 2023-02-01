import 'package:github_package/src/github_cache.dart';
import 'package:github_package/src/github_service.dart';
import 'package:github_package/src/model/search_result.dart';

class GithubRepository {
  final GithubService service;
  final GithubCache cache;

  GithubRepository({required this.service, required this.cache});

  searchItems(String query) async {
    if (cache.contains(query)) {
      return cache.get(query);
    } else {
      final result = await service.searchItem(query);
      cache.set(query, result);
      return result;
    }
  }
}
