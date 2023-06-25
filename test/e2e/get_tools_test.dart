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

  test('get tools', () async {
    await lifi.getTools().then((response) => expect(
          response.statusCode,
          200,
        ));
  });
}
