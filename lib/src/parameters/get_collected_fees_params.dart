import 'base_params.dart';
import '../utils/utils.dart';

class GetCollectedFeesParams implements BaseParams {
  /// Address or the name of the integrator that requests fee balances
  late String integratorId;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetCollectedFeesParams({
    required this.integratorId,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'integratorId': integratorId,
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
