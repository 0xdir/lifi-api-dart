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

  test('get quote', () async {
    GetQuoteParams getQuoteParams = GetQuoteParams(
      fromChain: 'ETH',
      toChain: 'ETH',
      fromToken: 'USDC',
      toToken: 'ETH',
      fromAddress: '0x27cE6d2ee1FFB855f5618f898E4BdA164c35573E',
      fromAmount: '${1000000 * 100}',
    );
    await lifi.getQuote(getQuoteParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
