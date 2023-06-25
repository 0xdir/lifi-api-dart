import '../src/parameters/get_gas_price_suggestion_params.dart';
import '../src/parameters/get_quote_params.dart';
import 'config/config.dart';
import 'endpoints/endpoints.dart';
import 'objects/response/response.dart';
import 'parameters/contract_call_params.dart';
import 'parameters/gas_gas_price_params.dart';
import 'parameters/get_collected_fees_params.dart';
import 'parameters/get_gas_prices_params.dart';
import 'parameters/get_gas_status_params.dart';
import 'parameters/get_possibilities_params.dart';
import 'parameters/get_routes_params.dart';
import 'parameters/get_status_params.dart';
import 'parameters/get_transactions_params.dart';
import 'parameters/get_withdraw_transaction_request_params.dart';
import 'parameters/refetch_params.dart';

class Lifi {
  final Config config;

  /// Initialize a connection to the Lifi API endpoint
  late final V1Endpoint api;

  /// Initialize the main Lifi object with desired configs
  Lifi(this.config) {
    api = V1Endpoint(config);
  }

  /// Get information about all currently supported chains
  Future<ApiResponse> getChains() async {
    return api.getChains();
  }

  /// Fetch all tokens known to the LI.FI services
  ///
  /// Restrict the resulting tokens to specific [chains] by providing
  /// the 3-letter symbol return from getChains().
  Future<ApiResponse> getTokens({List<String>? chains}) async {
    return api.getTokens(chains: chains);
  }

  /// Fetch information about a Token
  ///
  /// This endpoint can be used to get more information about
  /// a token by its address or symbol and its chain.
  ///
  /// Requires the Id or key of the [chain] that contains the [token],
  /// and the address or symbol of the [token] on the requested [chain].
  Future<ApiResponse> getToken({
    required String chain,
    required String token,
  }) async {
    return api.getToken(
      chain: chain,
      token: token,
    );
  }

  /// Get available bridges and exchanges
  ///
  /// Retrieve information about the bridges and exchanges
  /// available trough Lifi's service.
  Future<ApiResponse> getTools() async {
    return api.getTools();
  }

  /// Get all possible connections based on a from- or toChain
  ///
  /// This endpoint gives information about all possible tranfers
  /// between chains.
  ///
  /// Since the result can be very large it is required to pass
  /// at least one parameter to filter the results.
  ///
  /// Information about which chains and tokens are supported
  /// can be taken from the response of getChains().
  ///
  /// Information about which bridges and exchanges are supported
  /// can be taken from the response of getTools().
  Future<ApiResponse> getConnections({
    /// The chain that should be the start of the possible connections
    String? fromChain,

    /// The chain that should be the end of the possible connections
    String? toChain,

    /// Only return connections starting with this token
    String? fromToken,

    /// Only return connections ending with this token
    String? toToken,

    /// List of bridges that are allowed for this transaction
    ///
    /// Currently available bridges are for example hop, multichain
    /// or connext. All bridges can be retrieved from getTools().
    List<String>? allowBridges,
  }) async {
    return api.getConnections(
      fromChain: fromChain,
      toChain: toChain,
      fromToken: fromToken,
      toToken: toToken,
      allowBridges: allowBridges,
    );
  }

  /// Get a quote for a token transfer
  ///
  /// This endpoint can be used to request a quote for a transfer
  /// of one token to another, cross chain or not.
  ///
  /// The endpoint returns a Step object which contains information
  /// about the estimated result as well as a transactionRequest
  /// which can directly be sent to your wallet.
  ///
  /// The estimated result can be found inside the estimate,
  /// containing the estimated toAmount of the requested Token
  /// and the toAmountMin, which is the guaranteed minimum value
  /// that the transfer will yield including slippage.
  Future<ApiResponse> getQuote(
    GetQuoteParams params,
  ) async {
    return api.getQuote(params: params);
  }

  /// Perform a contract call across blockchains
  ///
  /// Bridge tokens, swap them and perform an arbitrary contract
  /// call on the destination chain.
  ///
  ///
  Future<ApiResponse> contractCall(
    ContractCallParams params,
  ) async {
    return api.contractCall(params: params);
  }

  /// Check the status of a cross chain transfer
  ///
  /// Cross chain transfers might take a while to complete. Waiting
  /// on the transaction on the sending chain doesn't help here.
  ///
  /// For this reason we build a simple endpoint that let's you check
  /// the status of your transfer.
  ///
  /// Important: The endpoint returns a 200 successful response
  /// even if the transaction can not be found. This behavior
  /// accounts for the case that the transaction hash is valid
  /// but the transaction has not been mined yet.
  ///
  /// While non of the parameters fromChain, toChain and bridge
  /// are required, passing the fromChain parameter will speed up
  /// the request and is therefore encouraged.
  Future<ApiResponse> getStatus(
    GetStatusParams params,
  ) async {
    return api.getStatus(params);
  }

  /// Get gas price for the specified chainId
  ///
  /// Retrieves the most recent gas prices for the supplied chainId
  Future<ApiResponse> getGasPrice(
    GetGasPriceParams params,
  ) async {
    return api.getGasPrice(params);
  }

  /// Get gas prices for enabled chains
  ///
  /// Retrieves the most recent gas prices for the enabled chains
  /// in the server.
  Future<ApiResponse> getGasPrices(
    GetGasPricesParams params,
  ) async {
    return api.getGasPrices(params);
  }

  /// Get a gas suggestion for the specified chain
  ///
  /// Retrieve a suggestion on how much gas is needed on the
  /// requested chain. The suggestion is based on the average price
  /// of 10 approvals and 10 uniswap based swaps via LI.FI
  /// on the specified chain.
  ///
  /// If fromChain and fromToken are specified, the result
  /// will contain information about how much fromToken amount
  /// the user has to send to receive the suggested gas amount
  /// on the requested chain.
  Future<ApiResponse> getGasPriceSuggestion(
    GetGasPriceSuggestionParams params,
  ) async {
    return api.getGasPriceSuggestion(params);
  }

  /// Get status information about a lifuel transaction
  Future<ApiResponse> getGasStatus(
    GetGasStatusParams params,
  ) async {
    return api.getGasStatus(params);
  }

  /// Force relayer to refetch transaction
  Future<ApiResponse> refetch(
    RefetchParams params,
  ) async {
    return api.refetch(params);
  }

  /// Get integrator's collected fees data for all supported chains
  /// request all integrator's collected fees data by tokens for all supported chains.
  ///
  /// The endpoint returns an Integrator object which contains
  /// the integrator name (or the address if the name wasn't found
  /// in configurations) and an array of fee balances for all
  /// supported chains.
  Future<ApiResponse> getCollectedFees(
    GetCollectedFeesParams params,
  ) async {
    return api.getCollectedFees(params);
  }

  /// Get transaction request for withdrawing collected fees for
  /// the specified chain
  ///
  /// If a list of token addresses is provided, the generated
  /// transaction will only withdraw the specified funds.
  ///
  /// If there are no collected fees for the provided token's
  /// addresses, the 400 error will be thrown.
  ///
  /// The endpoint returns a IntegratorWithdrawalTransactionResponse
  /// object which contains the transaction request.
  Future<ApiResponse> getWithdrawTransactionRequest(
    GetWithdrawTransactionRequestParams params,
  ) async {
    return api.getWithdrawTransactionRequest(params);
  }

  /// Get all transactions for a wallet
  Future<ApiResponse> getTransactions(
    GetTransactionParams params,
  ) async {
    return api.getTransactions(params);
  }

  /// Get information about available services, chains and tokens
  ///
  /// Get a set of possible based on a request
  /// that specifies which chains, exchanges and bridges
  /// are preferred or unwanted.
  ///
  /// Pass preferences regarding chain, exchanges and bridges.
  ///
  /// Currently available bridges are hop, multichain, cbridge,
  /// connext, amarok, hyphen, optimism, polygon, arbitrum,
  /// avalanche, across, stargate, gnosis and omni.
  ///
  ///
  /// Currently available exchanges are: 1inch, paraswap, openocean,
  /// 0x.
  ///
  /// Filter information by chains, tokens, bridges, or exchanges.
  Future<ApiResponse> getPossibilities(
    GetPossibilitiesParams params,
  ) async {
    return api.getPossibilities(params);
  }

  /// Get a set of routes for a request that describes a transfer
  /// of tokens
  ///
  /// In order to execute any transfer, you must first request
  /// possible Routes. From the result set a Route can be selected
  /// and executed by retrieving the transaction for every
  /// included Step using getStepTransaction().
  ///
  Future<ApiResponse> getRoutes(
    GetRoutesParams params,
  ) async {
    return api.getRoutes(params);
  }

  /// Get step transaction
  ///
  /// Populate a step with transaction data.
  ///
  /// This endpoint expects a full Step object which usually
  /// is retrieved by calling getRoutes() and selecting
  /// the most suitable Route.
  ///
  /// Afterwards the transaction for every required Step can
  /// be retrieved using this endpoint.
  Future<ApiResponse> getStepTransaction(
    params,
  ) async {
    return api.getStepTransaction(params);
  }

  void close() {
    api.close();
  }
}
