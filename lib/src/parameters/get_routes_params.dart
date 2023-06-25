import 'dart:core';

import 'base_params.dart';
import '../utils/utils.dart';

import '../objects/options/get_routes_options.dart';

/// The request object describes a desired any-to-any transfer
/// and contains all information necessary to calculate
/// the most efficient routes.
class GetRoutesParams implements BaseParams {
  /// The sending chain id
  late int fromChainId;

  /// The amount that should be transferred including all decimals
  /// (e.g. 1000000 for 1 USDC (6 decimals))
  late String fromAmount;

  /// The address of the sending Token
  late String fromTokenAddress;

  /// The id of the receiving chain
  late int toChainId;

  /// The address of the receiving Token
  late String toTokenAddress;

  /// Optional configuration for the routes
  late GetRoutesOptions? options;

  /// The sending wallet address
  late String? fromAddress;

  /// The receiving wallet address
  late String? toAddress;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetRoutesParams({
    required this.fromChainId,
    required this.fromAmount,
    required this.fromTokenAddress,
    required this.toChainId,
    required this.toTokenAddress,
    this.options,
    this.fromAddress,
    this.toAddress,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      'fromChainId': fromChainId,
      'fromAmount': fromAmount,
      'fromTokenAddress': fromTokenAddress,
      'toChainId': toChainId,
      'toTokenAddress': toTokenAddress,
      'options': options!.map,
      'fromAddress': fromAddress,
      'toAddress': toAddress,
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