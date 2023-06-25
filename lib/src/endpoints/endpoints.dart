import '../parameters/contract_call_params.dart';
import '../parameters/gas_gas_price_params.dart';
import '../parameters/get_collected_fees_params.dart';
import '../parameters/get_gas_price_suggestion_params.dart';
import '../parameters/get_gas_prices_params.dart';
import '../parameters/get_gas_status_params.dart';
import '../parameters/get_possibilities_params.dart';
import '../parameters/get_quote_params.dart';
import '../connection/connection.dart';
import '../objects/errors/get_connection_error.dart';
import '../objects/response/response.dart';
import '../config/config.dart';
import '../parameters/get_routes_params.dart';
import '../parameters/get_status_params.dart';
import '../parameters/get_step_transaction_params.dart';
import '../parameters/get_transactions_params.dart';
import '../parameters/get_withdraw_transaction_request_params.dart';
import '../parameters/refetch_params.dart';

/// This is the V1 api endpoint
class V1Endpoint {
  Config config;
  late Connection connection;

  V1Endpoint(this.config) {
    connection = Connection(config);
  }

  /// Get information about all currently supported chains
  Future<ApiResponse> getChains() async {
    ApiResponse response = await connection.get('chains');
    return response;
  }

  /// Fetch all tokens known to the LI.FI services
  Future<ApiResponse> getTokens({
    List<String>? chains,
  }) async {
    chains ??= [];
    String queryString = '?chains=';
    if (chains.isNotEmpty) {
      queryString += chains.join('%2C');
    }
    ApiResponse response = await connection.getWithQueryParams(
      'tokens',
      queryString,
    );
    return response;
  }

  /// Fetch information about a Token
  Future<ApiResponse> getToken({
    required String chain,
    required String token,
  }) async {
    String queryString = '?chain=$chain&token=$token';
    ApiResponse response = await connection.getWithQueryParams(
      'token',
      queryString,
    );
    return response;
  }

  /// Get available bridges and exchanges
  Future<ApiResponse> getTools() async {
    ApiResponse response = await connection.get('tools');
    return response;
  }

  /// Get all possible connections based on a from- or to-Chain
  Future<ApiResponse> getConnections({
    String? fromChain,
    String? toChain,
    String? fromToken,
    String? toToken,
    List<String>? allowBridges,
  }) async {
    /// Checks if any of the parameters are null and throws an error
    /// if so.
    if ([
      fromChain,
      toChain,
      fromToken,
      toToken,
      allowBridges,
    ].every((element) => element == null)) {
      throw GetConnectionsError();
    }
    List<String> queryList = [];
    String queryString = '?';

    if (fromChain != null) {
      queryList.add('fromChain=$fromChain');
    }
    if (toChain != null) {
      queryList.add('toChain=$toChain');
    }
    if (fromToken != null) {
      queryList.add('fromToken=$fromToken');
    }
    if (toToken != null) {
      queryList.add('toToken=$toToken');
    }
    if (allowBridges != null) {
      for (String i in allowBridges) {
        queryList.add('allowBridges=$i');
      }
    }
    queryString += queryList.join('&');

    ApiResponse response = await connection.getWithQueryParams(
      'connections',
      queryString,
    );
    return response;
  }

  /// Get a quote for a token transfer
  Future<ApiResponse> getQuote({
    required GetQuoteParams params,
  }) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response =
        await connection.getWithQueryParams('quote', queryString);
    return response;
  }

  /// Perform an arbitrary contract call across blockchains
  Future<ApiResponse> contractCall({
    required ContractCallParams params,
  }) async {
    /// Parse params to map
    Map<String, dynamic> paramsMap = params.map;

    ApiResponse response =
        await connection.post('quote/contractCall', paramsMap);
    return response;
  }

  /// Check the status of a cross chain transfer
  Future<ApiResponse> getStatus(
    GetStatusParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response =
        await connection.getWithQueryParams('status', queryString);
    return response;
  }

  /// Get gas price for the specified chainId
  Future<ApiResponse> getGasPrice(
    GetGasPriceParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'gas/prices/${params.chainId}',
      queryString,
    );
    return response;
  }

  /// Get gas prices for enabled chains
  Future<ApiResponse> getGasPrices(
    GetGasPricesParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'gas/prices/',
      queryString,
    );
    return response;
  }

  /// Get a gas suggestion for the specified chain
  Future<ApiResponse> getGasPriceSuggestion(
    GetGasPriceSuggestionParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'gas/suggestion/${params.chain}',
      queryString,
    );
    return response;
  }

  /// Get a gas suggestion for the specified chain
  Future<ApiResponse> getGasStatus(
    GetGasStatusParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'gas/status',
      queryString,
    );
    return response;
  }

  /// Force relayer to refetch transaction
  Future<ApiResponse> refetch(
    RefetchParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'gas/refetch',
      queryString,
    );
    return response;
  }

  /// Get integrator's collected fees data for all supported chains
  Future<ApiResponse> getCollectedFees(
    GetCollectedFeesParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'integrators/${params.integratorId}',
      queryString,
    );
    return response;
  }

  /// Get transaction request for withdrawing collected fees for
  /// the specified chain
  Future<ApiResponse> getWithdrawTransactionRequest(
      GetWithdrawTransactionRequestParams params) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'integrators/${params.integratorId}/'
      'withdraw/${params.chainId}',
      queryString,
    );
    return response;
  }

  /// Get all transactions for a wallet
  Future<ApiResponse> getTransactions(
    GetTransactionParams params,
  ) async {
    /// Get the query string
    String queryString = params.queryString;

    ApiResponse response = await connection.getWithQueryParams(
      'analytics/wallets/${params.walletAddress}',
      queryString,
    );
    return response;
  }

  /// Get information about available services, chains and tokens
  Future<ApiResponse> getPossibilities(
    GetPossibilitiesParams params,
  ) async {
    ApiResponse response = await connection.post(
      'advanced/possibilities',
      params.map,
    );
    return response;
  }

  /// Get a set of routes for a request that describes a transfer
  /// of tokens
  Future<ApiResponse> getRoutes(
    GetRoutesParams params,
  ) async {
    ApiResponse response = await connection.post(
      'advanced/routes',
      params.map,
    );
    return response;
  }

  /// Get step transaction
  Future<ApiResponse> getStepTransaction(
    GetStepTransactionParams params,
  ) async {
    ApiResponse response = await connection.post(
      'advanced/stepTransaction',
      params.map,
    );
    return response;
  }

  void close() {
    connection.close();
  }
}