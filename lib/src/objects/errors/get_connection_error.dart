/// At least one query param needs to be provided to filter the results.
class GetConnectionsError implements Exception {
  @override
  String toString() {
    return 'GetConnectionsError: Provide at least one query parameter.';
  }
}
