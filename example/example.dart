import 'package:lifi_api_dart/lifi_api_dart.dart';

void main() async {
  /// Set up the config
  Config config = Config(
    // Staging (ie.testnet) support is limited.
    environment: Constants.production,
    apiVersion: Constants.v1,
  );

  /// Initialize the main object
  Lifi lifi = Lifi(config);

  /// Get chains available on the service
  await lifi.getChains().then((r) => print(r.body));

  /// Get tokens available on specific chains
  await lifi.getTokens(chains: ['ETH', 'DAI']).then((r) => print(r.body));

  /// Get info of a particular token, on a specific chain
  await lifi.getToken(chain: 'ETH', token: 'DAI').then((r) => print(r.body));

  /// Get a quote for a token transfer
  ///
  /// The quote contains a Transaction that can be signed and sent
  /// to the network using a wallet provider. eg. Ethers
  GetQuoteParams getQuoteParams = GetQuoteParams(
    fromChain: 'ETH',
    toChain: 'ETH',
    fromToken: 'USDC',
    toToken: 'ETH',
    fromAddress: '0x27cE6d2ee1FFB855f5618f898E4BdA164c35573E',
    fromAmount: '1000000',
  );
  await lifi.getQuote(getQuoteParams).then((r) => print(r.body));

  /// Close the connection
  lifi.close();
}
