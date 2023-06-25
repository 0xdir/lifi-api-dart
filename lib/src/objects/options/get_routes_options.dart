/// Pass this as options to GetRoute().
class GetRoutesOptions {
  /// Custom string the developer who integrates LiFi can set
  late String? integrator;

  /// The maximum allowed slippage
  late double? slippage;

  /// Bridges that should be taken into consideration
  List<String>? bridges = [];

  /// Exchanges that should be taken into consideration
  List<String>? exchanges = [];

  /// The way the resulting routes should be ordered
  /// Options available:
  ///   RECOMMENDED, FASTEST, CHEAPEST, SAFEST
  late String? order;

  /// Whether infinite approval should be set
  late bool? infiniteApproval;

  /// Whether chain switches should be allowed in the routes
  late bool? allowSwitchChain;

  /// Integrators can set a wallet address as referrer to track them
  late String? referrer;

  /// The percent of the integrator's fee that is taken from every transaction
  late double? fee;

  /// The price impact threshold above which routes are hidden.
  ///
  /// As an example, one should specify 0.15 (15%) to hide routes
  /// with more than 15% price impact. The default is 10%.
  late double? maxPriceImpact;

  late Map<String, dynamic> map;

  GetRoutesOptions({
    this.integrator,
    this.slippage,
    this.bridges,
    this.exchanges,
    this.order,
    this.infiniteApproval,
    this.allowSwitchChain,
    this.referrer,
    this.fee,
    this.maxPriceImpact,
  }) {
    map = {
      'integrator': integrator,
      'slippage': slippage,
      'bridges': bridges,
      'exchanges': exchanges,
      'order': order,
      'infiniteApproval': infiniteApproval,
      'allowSwitchChain': allowSwitchChain,
      'referrer': referrer,
      'fee': fee,
      'maxPriceImpact': maxPriceImpact,
    };
  }
}
