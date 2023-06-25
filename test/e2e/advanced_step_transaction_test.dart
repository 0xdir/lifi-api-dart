import 'package:lifi_api_dart/lifi_api_dart.dart';
import 'package:test/test.dart';

void main() async {
  late Lifi lifi;
  late Config config;

  setUp(() {
    config = Config(
      environment: Constants.production,
      apiVersion: Constants.v1,
    );
    lifi = Lifi(config);
  });

  tearDown(() {
    lifi.close();
  });

  test('get step transaction', () async {
    /// Define tokens from and to
    Token fromToken = Token(
      address: '0x8f3cf7ad23cd3cadbd9735aff958023239c6a063',
      decimals: 18,
      symbol: 'DAI',
      chainId: 137,
      name: '(PoS) Dai Stablecoin',
    );

    Token toToken = Token(
      address: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48',
      decimals: 6,
      symbol: 'USDC',
      chainId: 1,
      name: 'USD Coin',
    );

    /// Get the routes
    GetRoutesOptions getRoutesOptions = GetRoutesOptions(
      bridges: [
        'hop',
        'cbridge',
      ],
      exchanges: [
        '1inch',
        'paraswap',
        'openocean',
        '0x',
      ],
      order: 'RECOMMENDED',
    );
    GetRoutesParams getRoutesParams = GetRoutesParams(
      fromChainId: fromToken.chainId,
      fromAmount: '1000000000000000000',
      fromTokenAddress: fromToken.address,
      toChainId: toToken.chainId,
      toTokenAddress: toToken.address,
      options: getRoutesOptions,
    );
    ApiResponse response = await lifi.getRoutes(getRoutesParams);

    /// Get a step
    var step = response.body['routes'][0]['steps'][0];

    /// Set up step options
    StepAction stepAction = StepAction(
      fromChainId: 137,
      fromAmount: '100000000',
      toChainId: 1,
      fromToken: fromToken,
      toToken: toToken,
    );

    GetStepTransactionParams getStepTransactionParams =
        GetStepTransactionParams(
      id: step['id'],
      type: step['type'],
      tool: step['tool'],
      action: stepAction,
    );
    await lifi
        .getStepTransaction(getStepTransactionParams)
        .then((response) => expect(
              response.runtimeType,
              ApiResponse(200, {}).runtimeType,
            ));
  });
}
