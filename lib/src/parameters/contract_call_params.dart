import './base_params.dart';
import '../utils/utils.dart';

/// Contains params for ContractCall endpoint
class ContractCallParams implements BaseParams {
  /// The sending chain
  ///
  /// Can be the chain id or chain key. Retrieve from getChains().
  final int fromChain;

  /// The token that should be transferred
  ///
  /// Can be the address or the symbol
  final String fromToken;

  /// The wallet that will send the transaction
  /// and contains the starting token
  final String fromAddress;

  /// The receiving chain
  ///
  /// Can be the chain id or chain key
  final int toChain;

  /// The token required to perform the contract interaction
  /// (can be something to stake, donate or to be used as payment)
  final String toToken;

  /// The amount of token required by the contract
  /// interaction
  ///
  /// The LI.FI API will try and generate a quote
  /// that guarantees at least that amount on the destination chain.
  final String toAmount;

  /// The address of the contract to interact with
  final String toContractAddress;

  /// Some contract interactions will output a token
  ///
  /// This is the case in things like staking. Omit this parameter
  /// if no token should be returned to the user.
  final String? contractOutputsToken;

  /// The calldata to be sent to the contract for the interaction
  /// on the destination chain.
  final String toContractCallData;

  /// The estimated gas used by the destination call. If this value
  /// is incorrect, the interaction may fail -- choose this carefully!
  final String toContractGasLimit;

  /// If the approval address is different than the contract
  /// to call, specify that address here
  final String? toApprovalAddress;

  /// If the call fails, use this address to send the bridged tokens
  /// to.
  ///
  /// If none is specified, the sending address will be used.
  final String? toFallbackAddress;

  /// The maximum allowed slippage for the transaction as a
  /// decimal value. 0.005 represents 0.5%.
  final double? slippage;

  /// A string containing tracking information about the integrator
  /// of the API
  final String? integrator;

  /// A string containing tracking information about the referrer
  /// of the integrator
  final String? referrer;

  /// List of bridges that are allowed for this transaction
  ///
  /// Currently available bridges are for example hop, multichain
  /// or connext. All supported bridges can be loaded from the
  /// getTools() endpoint.
  final List<String>? allowBridges;

  /// List of bridges that are not allowed for this transaction
  ///
  /// Currently available bridges are for example hop, multichain
  /// or connext. All supported bridges can be loaded from the
  /// getTools() endpoint.
  final List<String>? denyBridges;

  /// List of bridges that should be preferred for this transaction
  ///
  /// Currently available bridges are for example hop, multichain
  /// or connext. All supported bridges can be loaded from the
  /// getTools() endpoint.
  final List<String>? preferBridges;

  /// List of exchanges that are allowed for this transaction.
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes.
  final List<String>? allowExchanges;

  /// List of exchanges that are not allowed for this transaction
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes.
  final List<String>? denyExchanges;

  /// List of exchanges that should be preferred for this transaction
  ///
  /// Currently available exchanges are aggregators such as 1inch,
  /// paraswap, openocean and 0x and a lot of dexes.
  final List<String>? preferExchanges;

  /// The price impact threshold above which routes are hidden
  ///
  /// As an example, one should specify 0.15 (15%) to hide routes
  /// with more than 15% price impact. The default is 10%.
  final double? maxPriceImpact;

  /// Whether swaps or other contract calls should be allowed
  /// as part of the destination transaction of a bridge transfer
  ///
  /// Separate swap transactions on the destination chain are not
  /// affected by this flag. By default, parameter is true.
  final bool? allowDestinationCall;

  /// A map of the params, where nulls are removed
  @override
  late Map<String, dynamic> map;

  /// The query string
  @override
  late String queryString;

  ContractCallParams({
    required this.fromChain,
    required this.fromToken,
    required this.fromAddress,
    required this.toChain,
    required this.toToken,
    required this.toAmount,
    required this.toContractAddress,
    this.contractOutputsToken,
    required this.toContractCallData,
    required this.toContractGasLimit,
    this.toApprovalAddress,
    this.toFallbackAddress,
    this.slippage,
    this.integrator,
    this.referrer,
    this.allowBridges,
    this.denyBridges,
    this.preferBridges,
    this.allowExchanges,
    this.denyExchanges,
    this.preferExchanges,
    this.maxPriceImpact,
    this.allowDestinationCall,
  }) {
    map = _asMap();
    queryString = _toQueryString();
  }

  /// Parse params to map, remove optional values not provided, if any
  Map<String, dynamic> _asMap() {
    map = removeNulls({
      // Required
      'fromChain': fromChain,
      'fromToken': fromToken,
      'fromAddress': fromAddress,
      'toChain': toChain,
      'toToken': toToken,
      'toAmount': toAmount,
      'toContractAddress': toContractAddress,
      'contractOutputsToken': contractOutputsToken,
      'toContractCallData': toContractCallData,
      'toContractGasLimit': toContractGasLimit,
      // Optional
      'toApprovalAddress': toApprovalAddress,
      'toFallbackAddress': toFallbackAddress,
      'slippage': slippage,
      'integrator': integrator,
      'referrer': referrer,
      'allowBridges': allowBridges,
      'denyBridges': denyBridges,
      'preferBridges': preferBridges,
      'allowExchanges': allowExchanges,
      'denyExchanges': denyExchanges,
      'preferExchanges': preferExchanges,
      'maxPriceImpact': maxPriceImpact,
      'allowDestinationCall': allowDestinationCall,
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
