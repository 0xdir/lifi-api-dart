import 'token.dart';

/// The action that is taken within a step
class Action {
  final int fromChainId;
  final int toChainId;
  final Token fromToken;
  final Token toToken;
  final String fromAmount;
  final double slippage;

  Action({
    required this.fromChainId,
    required this.toChainId,
    required this.fromToken,
    required this.toToken,
    required this.fromAmount,
    required this.slippage,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      fromChainId: json['fromChainId'],
      toChainId: json['toChainId'],
      fromToken: Token.fromJson(json['fromToken']),
      toToken: Token.fromJson(json['toToken']),
      fromAmount: json['fromAmount'],
      slippage: json['slippage'].toDouble(),
    );
  }
}
