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

  test('get transactions', () async {
    GetTransactionParams getTransactionParams = GetTransactionParams(
      walletAddress: '0x27cE6d2ee1FFB855f5618f898E4BdA164c35573E',
      integrator: '0x552008c0f6870c2f77e5cC1d2eb9bdff03e30Ea0',
    );
    await lifi.getTransactions(getTransactionParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
