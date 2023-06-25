[![pub package](https://img.shields.io/pub/v/lifi_api_dart.svg)](https://pub.dev/packages/lifi_api_dart)
[![package publisher](https://img.shields.io/pub/publisher/lifi_api_dart.svg)](https://pub.dev/packages/lifi_api_dart/publisher)

A Future-based library to interact with the Li.Fi API.

This package is a wrapper around the [Li.Fi API], allowing easy swapping of tokens
between blockchain networks with Dart. It is multi-platform, with limited dependencies 
for use in mobile, desktop, or browser apps.

[Li.Fi API]: https://docs.li.fi/li.fi-api/li.fi-api

This community package is designed to follow the [Li.Fi API Documentation] as closely
as possible. 

[Li.Fi API Documentation]: https://apidocs.li.fi/reference/welcome-to-the-lifinance-api

## Using

The easiest way to use this library is via the top-level ```Lifi``` class.

```dart
import 'package:lifi_api_dart/lifi_api_dart.dart';

void main() async {
  /// Set up the config
  Config config = Config(
    environment: Constants.production, // mainnets
    // environment: Constants.staging, // testnets
    apiVersion: Constants.v1,
  );

  /// Initialize the main object
  Lifi lifi = Lifi(config);

  /// Prepare options for the quote
  GetQuoteParams getQuoteParams = GetQuoteParams(
    fromChain: 'ETH',
    toChain: 'POL',
    fromToken: 'USDC',
    toToken: 'ETH',
    fromAddress: '0x_sender_address',
    fromAmount: '100000000',
  );

  /// Get a quote
  /// 
  /// The response contains a Transaction that can be signed and sent
  /// to the network using a wallet provider. eg. Ethers
  var response = await lifi.getQuote(getQuoteParams);

  /// Close the connection
  lifi.close();
}
```

## Testing your integration

Testnet support is limited and not reflective of the production environment. If possible, 
try to use LI.FI on a mainnet with low gas fees instead.

[limited]: https://docs.li.fi/integrate-li.fi-js-sdk/testing-your-integration/supported-testnets-and-tokens

Switch between staging (testnet) and production by changing the ```environment``` value 
in the config.

```dart
  /// Set up the config
  Config config = Config(
    environment: Constants.production, // mainnet
    // environment: Constants.staging, // testnets
    apiVersion: Constants.v1,
  );
```

## Advanced endpoints

Although advanced endpoints such as ```getPossibilities```, ```getRoutes```, and
```getStepTransaction``` are [not recommended] to be used directly, they are included
in this library for completeness.

[not recommended]: https://apidocs.li.fi/reference/advanced-1

## Getting Help

Submit an issue on [github].

[github]: https://github.com/0xdir/lifi_api_dart

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github]
2. Discuss proposed changes
3. Submit a PR (optional)

[github]: https://github.com/0xdir/lifi_api_dart

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, reach out to me on [github].

[github]: https://github.com/0xdir/lifi_api_dart

Or buy my coffee at `0xdir.near`.