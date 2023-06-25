import 'base_params.dart';
import '../utils/utils.dart';

class GetGasPricesParams implements BaseParams {
  /// Can be the chain id or chain key. Retrieve from getChains().
  late bool? refresh;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetGasPricesParams({
    this.refresh,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      // Optional
      'refresh': refresh,
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
