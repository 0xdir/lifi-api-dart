/// Remove nulls, if any
Map<String, dynamic> removeNulls(targetMap) {
  targetMap.removeWhere((key, value) => value == null);
  return targetMap;
}

/// Prepare the query string
String makeQueryString(paramsMap) {
  String queryString =
      '?${Uri(queryParameters: paramsMap.map((key, value) => MapEntry(
            key,
            value.toString(),
          ))).query}';
  return queryString;
}
