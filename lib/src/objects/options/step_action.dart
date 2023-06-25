import '../token.dart';

/// Pass this as options to GetStepTransaction().
class StepAction {
  ///  The id of the chain where the transfer should start
  late int fromChainId;

  ///  The amount that should be transferred including all decimals (e.g. 1000000 for 1 USDC (6 decimals))
  late String fromAmount;

  ///  The id of the chain where the transfer should end
  late int toChainId;

  ///  Representation of a Token
  late Token fromToken;

  ///  Representation of a Token
  late Token toToken;

  ///  The maximum allowed slippage
  late double? slippage;

  late Map<String, dynamic> map;

  StepAction({
    required this.fromChainId,
    required this.fromAmount,
    required this.toChainId,
    required this.fromToken,
    required this.toToken,
    this.slippage,
  }) {
    map = {
      'fromChainId': fromChainId,
      'fromAmount': fromAmount,
      'toChainId': toChainId,
      'fromToken': fromToken.map,
      'toToken': toToken.map,
      'slippage': slippage,
    };
  }
}
