class SearchResultError {
  final String message;

  SearchResultError({required this.message});

  factory SearchResultError.fromJson(Map<String, dynamic> json) {
    return SearchResultError(
      message: json['message'],
    );
  }
}
