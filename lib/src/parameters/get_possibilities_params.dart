import 'base_params.dart';
import '../utils/utils.dart';

class GetPossibilitiesParams implements BaseParams {
  /// The ids of the chains that should be taken into consideration
  /// for the possibilities
  late List<int>? chains;

  /// Bridges that should or should not be routed through
  Map<String, List<String>>? bridges = {
    'allow': [],
    'deny': [],
    'prefer': [],
  };

  /// Exchanges that should or should not be routed through
  Map<String, List<String>>? exchanges = {
    'allow': [],
    'deny': [],
    'prefer': [],
  };

  /// Filter information by chains, tokens, bridges, or exchanges.
  ///
  /// Possible values are chains, tokens, bridges, and exchanges.
  List<String>? include;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetPossibilitiesParams({
    this.chains,
    this.bridges,
    this.exchanges,
    this.include,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'chains': chains,
      'bridges': bridges,
      'exchanges': exchanges,
      'include': include,
    });
    return map;
  }

  /// Prepare the query string
  String _toQueryString() {
    return '?${Uri(queryParameters: map.map((key, value) => MapEntry(
          key,
          value.toString(),
        ))).query}';
  }
}
