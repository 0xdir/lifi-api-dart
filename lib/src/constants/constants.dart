/// Holds the constants
class Constants {
  static String staging = Environment.staging.value;
  static String production = Environment.production.value;
  static String v1 = Environment.v1.value;
}

/// Defines the staging and production endpoints
enum Environment {
  staging('https://staging.li.quest/v1/'),
  production('https://li.quest/v1/'),
  v1('v1');

  const Environment(this.value);

  final String value;
}
