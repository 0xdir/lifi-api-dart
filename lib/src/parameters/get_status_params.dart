import 'base_params.dart';
import '../utils/utils.dart';

class GetStatusParams implements BaseParams {
  /// The transaction hash on the sending chain
  late String txHash;

  /// The bridging tool used for the transfer
  late String? bridge;

  /// The sending chain. Can be the chain id or chain key
  late String? hopFromChain;

  /// The receiving chain. Can be the chain id or chain key
  late String? toChain;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetStatusParams({
    required this.txHash,
    this.bridge,
    this.hopFromChain,
    this.toChain,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'txHash': txHash,
      'bridge': bridge,
      'hopFromChain': hopFromChain,
      'toChain': toChain,
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
