/// A base class to define params
abstract class BaseParams {
  /// A map of the params
  ///
  /// nulls may or may not be removed depending on the implementation.
  late Map<String, dynamic> map;

  /// The query string
  late String queryString;
}
