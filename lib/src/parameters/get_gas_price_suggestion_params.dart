import './base_params.dart';
import '../utils/utils.dart';

class GetGasPriceSuggestionParams implements BaseParams {
  /// Chain from which gas prices should be shown (can be a chain id or a chain key)
  late String chain;

  /// If fromChain and fromToken are specified, the result will contain information about how much fromToken amount the user has to send to receive the suggested gas amount on the requested chain.
  late String? fromChain;

  /// If fromChain and fromToken are specified, the result will contain information about how much fromToken amount the user has to send to receive the suggested gas amount on the requested chain.
  late String? fromToken;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetGasPriceSuggestionParams({
    required this.chain,
    this.fromChain,
    this.fromToken,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'chain': chain,
      'fromChain': fromChain,
      'fromToken': fromToken,
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
