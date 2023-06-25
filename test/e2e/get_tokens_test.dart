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

  test('get tokens', () async {
    await lifi.getTokens(chains: ['ETH', 'DAI']).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get token', () async {
    await lifi.getToken(chain: 'ETH', token: 'DAI').then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
