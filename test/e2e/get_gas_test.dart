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

  test('get gas price', () async {
    GetGasPriceParams getGasPriceParams = GetGasPriceParams(
      chainId: '1',
      refresh: 'true',
    );
    await lifi.getGasPrice(getGasPriceParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get gas prices', () async {
    GetGasPricesParams getGasPricesParams = GetGasPricesParams(
      refresh: true,
    );
    await lifi.getGasPrices(getGasPricesParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get gas status', () async {
    GetGasStatusParams getGasStatusParams = GetGasStatusParams(
      txHash:
          '0x74546ce8aac58d33c212474293dcfeeadecef115847da75131a2ff6692e03b96',
    );
    await lifi.getGasStatus(getGasStatusParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('refetch transaction', () async {
    RefetchParams refetchParams = RefetchParams(
        txHash:
            '0x74546ce8aac58d33c212474293dcfeeadecef115847da75131a2ff6692e03b96',
        chainId: '1');
    await lifi.refetch(refetchParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
