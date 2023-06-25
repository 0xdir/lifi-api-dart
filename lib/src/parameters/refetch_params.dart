import 'base_params.dart';
import '../utils/utils.dart';

class RefetchParams implements BaseParams {
  /// The transaction hash that started the gas refilling process
  late String txHash;

  /// The chain where the deposit was originally made
  late String chainId;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  RefetchParams({
    required this.txHash,
    required this.chainId,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'txHash': txHash,
      'chainId': chainId,
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
