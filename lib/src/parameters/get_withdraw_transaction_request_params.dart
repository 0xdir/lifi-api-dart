import 'base_params.dart';
import '../utils/utils.dart';

class GetWithdrawTransactionRequestParams implements BaseParams {
  /// Address or the name of the integrator that requests fee withdrawal
  late String integratorId;

  /// Specify chainId from which funds should be withdrawn
  late String chainId;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetWithdrawTransactionRequestParams({
    required this.integratorId,
    required this.chainId,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'integratorId': integratorId,
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
