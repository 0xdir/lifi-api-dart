import 'token.dart';

/// The Fees incurred for the step
class FeeCost {
  late String name;
  late String description;
  late String percentage;
  late Token token;
  late String amount;
  late String amountUSD;
  late bool included;

  /// A map of the params
  late Map<String, dynamic> map;

  FeeCost.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    percentage = json['percentage'];
    token = Token.fromJson(json['token']);
    amount = json['amount'];
    amountUSD = json['amountUSD'];
    included = json['included'];

    map = {
      'name': name,
      'description': description,
      'percentage': percentage,
      'token': token.map,
      'amount': amount,
      'amountUSD': amountUSD,
      'included': included,
    };
  }
}
