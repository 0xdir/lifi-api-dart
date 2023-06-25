/// Contains details of a token.
///
/// Used in advanced endpoints.
class Token {
  final String address;
  final String symbol;
  final int decimals;
  final int chainId;
  final String name;
  final String? coinKey;
  final String? priceUSD;
  final String? logoURI;

  late Map<String, dynamic> map;

  Token({
    required this.address,
    required this.symbol,
    required this.decimals,
    required this.chainId,
    required this.name,
    this.coinKey,
    this.priceUSD,
    this.logoURI,
  }) {
    map = {
      "address": address,
      "symbol": symbol,
      "decimals": decimals,
      "chainId": chainId,
      "name": name,
      "coinKey": coinKey,
      "priceUSD": priceUSD,
      "logoURI": logoURI,
    };
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      address: json['address'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      chainId: json['chainId'],
      name: json['name'],
      coinKey: json['coinKey'],
      priceUSD: json['priceUSD'],
      logoURI: json['logoURI'],
    );
  }
}
