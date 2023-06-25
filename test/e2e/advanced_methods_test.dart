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

  test('get possibilities', () async {
    GetPossibilitiesParams params = GetPossibilitiesParams(
      chains: [1],
      bridges: {
        'allow': ['hop', 'cbridge'],
        'deny': ['multichain'],
        'prefer': ['cbridge'],
      },
      include: ['chains'],
    );
    await lifi.getPossibilities(params).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get routes', () async {
    GetRoutesOptions getRoutesOptions = GetRoutesOptions(
      bridges: ['hop', 'cbridge'],
      exchanges: ['1inch', 'paraswap', 'openocean', '0x'],
      order: 'RECOMMENDED',
    );
    GetRoutesParams getRoutesParams = GetRoutesParams(
      fromChainId: 100,
      fromAmount: '1000000000000000000',
      fromTokenAddress: '0x63e62989d9eb2d37dfdb1f93a22f063635b07d51',
      toChainId: 137,
      toTokenAddress: '0xc0b2983a17573660053beeed6fdb1053107cf387',
      options: getRoutesOptions,
    );
    await lifi.getRoutes(getRoutesParams).then((response) => expect(
          response.statusCode,
          200,
        ));
  });

  test('get possibilities', () async {
    GetPossibilitiesParams params = GetPossibilitiesParams(
      chains: [1],
      bridges: {
        'allow': ['hop', 'cbridge'],
        'deny': ['multichain'],
        'prefer': ['cbridge'],
      },
      include: ['chains'],
    );
    await lifi.getPossibilities(params).then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
