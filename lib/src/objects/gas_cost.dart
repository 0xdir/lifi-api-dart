import 'token.dart';

/// The gas incurred for the step
class GasCost {
  late String type;
  late String price;
  late String estimate;
  late String limit;
  late String amount;
  late String amountUSD;
  late Token token;

  /// A map of the params
  late Map<String, dynamic> map;

  GasCost.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    estimate = json['estimate'];
    limit = json['limit'];
    amount = json['amount'];
    amountUSD = json['amountUSD'];
    token = Token.fromJson(json['token']);
    map = {
      'type': type,
      'price': price,
      'estimate': estimate,
      'limit': limit,
      'amount': amount,
      'amountUSD': amountUSD,
      'token': token.map,
    };
  }
}
