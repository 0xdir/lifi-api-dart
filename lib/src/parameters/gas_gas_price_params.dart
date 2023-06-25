import '../../../src/parameters/base_params.dart';
import '../../../src/utils/utils.dart';

class GetGasPriceParams implements BaseParams {
  /// ChaindId from which gas prices should be shown
  late String chainId;

  /// If true it wil get the freshest gas prices available.
  late String? refresh;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetGasPriceParams({
    required this.chainId,
    this.refresh,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      // required
      'chainId': chainId,
      // optional
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