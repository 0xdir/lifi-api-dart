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

  test('get status', () async {
    GetStatusParams getStatusParams = GetStatusParams(
      txHash:
          '0x807e84fcea166e316742f811a47c464c02cc1f2cd176f514308244831cc67182',
      bridge: 'hop',
      hopFromChain: 'ETH',
      toChain: 'ARB',
    );
    await lifi.getStatus(getStatusParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
