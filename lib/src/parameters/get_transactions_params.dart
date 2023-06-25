import 'base_params.dart';
import '../utils/utils.dart';

class GetTransactionParams implements BaseParams {
  /// The address of the wallet
  late String walletAddress;

  /// Filter the transactions by integrator
  late String? integrator;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetTransactionParams({
    required this.walletAddress,
    this.integrator,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'wallet_address': walletAddress,
      'integrator': integrator,
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
