import 'fee_cost.dart';
import 'gas_cost.dart';

/// An estimate of the amounts and costs for the step
class Estimate {
  late String fromAmount;
  late String toAmount;
  late String toAmountMin;
  late String approvalAddress;
  late List<Map<String, dynamic>> feeCosts;
  late List<Map<String, dynamic>> gasCosts;
  Map<String, dynamic>? data;

  /// A map of the params
  late Map<String, dynamic> map;

  Estimate({
    required this.fromAmount,
    required this.toAmount,
    required this.toAmountMin,
    required this.approvalAddress,
    required this.feeCosts,
    required this.gasCosts,
    this.data,
  }) {
    map = {
      'fromAmount': fromAmount,
      'toAmount': toAmount,
      'toAmountMin': toAmountMin,
      'approvalAddress': approvalAddress,
      'feeCosts': feeCosts,
      'gasCosts': gasCosts,
      'data': data,
    };
  }

  Estimate.fromJson(Map<String, dynamic> json) {
    fromAmount = json['fromAmount'];
    toAmount = json['toAmount'];
    toAmountMin = json['toAmountMin'];
    approvalAddress = json['approvalAddress'];
    feeCosts = List<Map<String, dynamic>>.from(
        json['feeCosts'].map((fee) => FeeCost.fromJson(fee).map));
    gasCosts = List<Map<String, dynamic>>.from(
        json['gasCosts'].map((gas) => GasCost.fromJson(gas).map));
    data = data == null ? null : json['data'];

    map = {
      'fromAmount': fromAmount,
      'toAmount': toAmount,
      'toAmountMin': toAmountMin,
      'approvalAddress': approvalAddress,
      'feeCosts': feeCosts,
      'gasCosts': gasCosts,
      'data': data,
    };
  }
}
