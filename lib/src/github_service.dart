import 'dart:convert';
import 'dart:io';

import 'package:github_package/src/model/search_result.dart';
import 'package:github_package/src/model/search_result_error.dart';
import 'package:http/http.dart' as http;

typedef HttpClient = http.Client;

class GithubService {
  final String _baseUrl = 'https://api.github.com/search/repositories?q=';
  final HttpClient _client;

  GithubService({HttpClient? client}) : _client = client ?? HttpClient();

  Future<SearchResult> searchItem(String param) async {
    final response = await _client.get(Uri.parse('$_baseUrl$param'));
    final results = json.decode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw SearchResultError.fromJson(results);
    }
    return SearchResult.fromJson(results);
  }
}
