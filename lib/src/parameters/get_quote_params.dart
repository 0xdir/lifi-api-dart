import 'base_params.dart';
import '../utils/utils.dart';

class GetQuoteParams implements BaseParams {
  /// The sending chain
  ///
  /// Can be the chain id or chain key
  late String fromChain;

  /// The receiving chain
  ///
  /// Can be the chain id or chain key
  late String toChain;

  /// The token that should be transferred
  ///
  /// Can be the address or the symbol
  late String fromToken;

  /// The token that should be transferred to
  ///
  /// Can be the address or the symbol
  late String toToken;

  /// The sending wallet address
  late String fromAddress;

  /// The receiving wallet address
  ///
  /// If none is provided, the [fromAddress] will be used
  String? toAddress;

  /// The amount that should be sent including all decimals
  ///
  /// (e.g. 1000000 for 1 USDC (6 decimals))
  late String fromAmount;

  /// Which kind of route should be preferred
  ///
  /// RECOMMENDED: This sorting criterion aims to find a balance
  /// between cost and complexity, prioritizing affordable and less
  /// complex routes. It first sorts routes based on their cost
  /// and then focuses on the top 5% of the routes. These top
  /// routes are ranked by considering both their cheapness and
  /// ease of use.
  ///
  /// FASTEST: This sorting criterion prioritizes routes with the
  /// shortest estimated execution time. Users who value speed and want
  /// their transactions to be completed as quickly as possible should
  /// choose the fastest routes.
  ///
  /// CHEAPEST: This criterion focuses on minimizing the cost of the
  /// transaction, whether in token amount or USD amount (USD amount
  /// minus gas cost). Users looking for the most economical option
  /// should choose the cheapest routes.
  ///
  /// SAFEST: Sorting by this criterion emphasizes the safety
  /// and reliability of the routes. Routes are ranked based on
  /// the safety level of the tools (bridges) used in their steps.
  /// Users who prioritize security and want to minimize risks
  /// associated with their transactions should choose the safest
  /// routes. If two routes have the same safety level, they
  /// are further ranked based on their speed.
  String? order;

  /// The maximum allowed [slippage] for the transaction as a decimal
  /// value
  ///
  /// 0.005 represents 0.5%.
  double? slippage;

  /// A string containing tracking information about the integrator
  /// of the API
  String? integrator;

  /// The percent of the integrator's fee that is taken from every
  /// transaction.
  ///
  /// 0.02 represents 2%. The maximum fee amount is 10%.
  double? fee;

  /// A string containing tracking information about the referrer
  /// of the integrator
  String? referrer;

  /// List of bridges that are allowed for this transaction
  ///
  /// Currently available bridges are for example hop,
  /// multichain or connext.
  ///
  /// All supported bridges can be loaded from the getTools() endpoint.
  ///
  /// Also values all, none, default and [] are acceptable and mean
  /// all tools of the current type (all), no tools (for none
  /// and [] cases) and default tool's settings on the current stage.
  List<String>? allowBridges;

  /// List of exchanges that are allowed for this transaction
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes. All supported
  /// exchanges can be loaded from the getTools() endpoint.
  ///
  /// Also values all, none, default and [] are acceptable
  /// and mean all tools of the current type (all), no tools
  /// (for none and [] cases) and default tool's settings
  /// on the current stage.
  List<String>? allowExchanges;

  /// List of bridges that are not allowed for this transaction
  ///
  /// Currently available bridges are for example hop,
  /// multichain or connext. All supported bridges can be loaded
  /// from the getTools() endpoint. Also values all, none, default
  /// and [] are acceptable and mean all tools of the current
  /// type (all), no tools (for none and [] cases) and default
  /// tool's settings on the current stage.
  List<String>? denyBridges;

  /// List of exchanges that are not allowed for this transaction
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes. All supported
  /// exchanges can be loaded from the getTools() endpoint.
  ///
  /// Also values all, none, default and [] are acceptable and mean
  /// all tools of the current type (all), no tools (for none
  /// and [] cases) and default tool's settings on the current stage.
  List<String>? denyExchanges;

  /// List of bridges that should be preferred for this transaction
  ///
  /// Currently available bridges are for example hop, multichain
  /// or connext. All supported bridges can be loaded from the
  /// getTools() endpoint.
  ///
  /// Also values all, none, default and [] are acceptable and mean
  /// all tools of the current type (all), no tools (for none and []
  /// cases) and default tool's settings on the current stage.
  List<String>? preferBridges;

  /// List of exchanges that should be preferred for this transaction
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes.
  ///
  /// All supported exchanges can be loaded from the getTools() endpoint.
  ///
  /// Also values all, none, default and [] are acceptable and mean
  /// ll tools of the current type (all), no tools (for none and []
  /// cases) and default tool's settings on the current stage.
  List<String>? preferExchanges;

  /// Whether swaps or other contract calls should be allowed
  /// as part of the destination transaction of a bridge transfer
  ///
  /// Separate swap transactions on the destination chain
  /// are not affected by this flag. By default, parameter is true.
  bool? allowDestinationCall;

  /// The price impact threshold above which routes are hidden
  ///
  /// As an example, one should specify 0.15 (15%) to hide routes
  /// with more than 15% price impact. The default is 10%.
  double? maxPriceImpact;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  GetQuoteParams({
    required this.fromChain,
    required this.toChain,
    required this.fromToken,
    required this.toToken,
    required this.fromAddress,
    required this.fromAmount,
    this.toAddress,
    this.order,
    this.slippage,
    this.integrator,
    this.fee,
    this.referrer,
    this.allowBridges,
    this.allowExchanges,
    this.denyBridges,
    this.denyExchanges,
    this.preferBridges,
    this.preferExchanges,
    this.allowDestinationCall,
    this.maxPriceImpact,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      // required
      'fromChain': fromChain,
      'toChain': toChain,
      'fromToken': fromToken,
      'toToken': toToken,
      'fromAddress': fromAddress,
      'fromAmount': fromAmount,
      // optional
      'toAddress': toAddress,
      'order': order,
      'slippage': slippage,
      'integrator': integrator,
      'fee': fee,
      'referrer': referrer,
      'allowBridges': allowBridges,
      'allowExchanges': allowExchanges,
      'denyBridges': denyBridges,
      'denyExchanges': denyExchanges,
      'preferBridges': preferBridges,
      'preferExchanges': preferExchanges,
      'allowDestinationCall': allowDestinationCall,
      'maxPriceImpact': maxPriceImpact,
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
