import 'dart:core';

import '../objects/estimate.dart';
import '../objects/options/step_action.dart';
import '../parameters/base_params.dart';

/// The step object
class GetStepTransactionParams implements BaseParams {
  /// Unique identifier of the step
  late String id;

  /// The type of the step
  /// Options: swap, cross, lifi
  late String type;

  /// The tool used for this step. E.g. connext
  late String tool;

  /// The action of the step
  late StepAction action;

  /// The estimation for the step
  late Estimate? estimate;

  /// A string containing tracking information about the integrator
  /// of the API
  late String? integrator;

  /// A string containing tracking information about the referrer
  /// of the integrator
  late String? referrer;

  /// An objection containing status information about the execution
  late String? execution;

  /// An ether.js TransactionRequest that can be triggered using
  /// a wallet provider.
  /// (https://docs.ethers.io/v5/api/providers/types/#providers-TransactionRequest)
  late String? transactionRequest;

  /// A map of the params
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetStepTransactionParams({
    required this.id,
    required this.type,
    required this.tool,
    required this.action,
    this.estimate,
    this.integrator,
    this.referrer,
    this.execution,
    this.transactionRequest,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = {
      'id': id,
      'type': type,
      'tool': tool,
      'action': action.map,
      'estimate': estimate == null ? estimate : estimate!.map,
      'integrator': integrator,
      'referrer': referrer,
      'execution': execution,
      'transactionRequest': transactionRequest,
    };
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