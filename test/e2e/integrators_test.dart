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

  test('get collected fees', () async {
    GetCollectedFeesParams params = GetCollectedFeesParams(
      integratorId: '0x552008c0f6870c2f77e5cC1d2eb9bdff03e30Ea0',
    );
    await lifi.getCollectedFees(params).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get withdraw transaction request', () async {
    GetWithdrawTransactionRequestParams params =
        GetWithdrawTransactionRequestParams(
      integratorId: '0x552008c0f6870c2f77e5cC1d2eb9bdff03e30Ea0',
      chainId: '137',
    );
    await lifi.getWithdrawTransactionRequest(params).then((response) => expect(
          response.statusCode,
          400,
        ));
  });
}
