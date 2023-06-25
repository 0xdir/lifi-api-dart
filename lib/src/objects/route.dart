import 'token.dart';
import 'step.dart';

/// A route that is possible for the from/to chains and token.
class Route {
  final String id;
  final int fromChainId;
  final String fromAmountUSD;
  final String fromAmount;
  final Token fromToken;
  final int toChainId;
  final String toAmountUSD;
  final String toAmount;
  final String toAmountMin;
  final Token toToken;
  final String gasCostUSD;
  final List<Step> steps;

  Route({
    required this.id,
    required this.fromChainId,
    required this.fromAmountUSD,
    required this.fromAmount,
    required this.fromToken,
    required this.toChainId,
    required this.toAmountUSD,
    required this.toAmount,
    required this.toAmountMin,
    required this.toToken,
    required this.gasCostUSD,
    required this.steps,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      id: json['id'],
      fromChainId: json['fromChainId'],
      fromAmountUSD: json['fromAmountUSD'],
      fromAmount: json['fromAmount'],
      fromToken: Token.fromJson(json['fromToken']),
      toChainId: json['toChainId'],
      toAmountUSD: json['toAmountUSD'],
      toAmount: json['toAmount'],
      toAmountMin: json['toAmountMin'],
      toToken: Token.fromJson(json['toToken']),
      gasCostUSD: json['gasCostUSD'],
      steps: List<Step>.from(json['steps'].map((step) => Step.fromJson(step))),
    );
  }
}
