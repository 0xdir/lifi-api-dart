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

  test('contact call', () async {
    ContractCallParams contractCallParams = ContractCallParams(
      fromChain: 1,
      fromToken: 'USDC',
      fromAddress: '0x552008c0f6870c2f77e5cC1d2eb9bdff03e30Ea0',
      toChain: 137,
      toToken: 'USDC',
      toAmount: '300000000',
      toContractAddress: '0xEde3bd57a04960E6469B70B4863cE1c9d9363Cb8',
      toContractCallData: '0x',
      toContractGasLimit: '900000',
    );
    await lifi.contractCall(contractCallParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
