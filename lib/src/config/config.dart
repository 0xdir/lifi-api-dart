import '../constants/constants.dart';

/// Config settings
class Config {
  String? environment = Constants.staging;
  String? apiVersion = Constants.v1;

  Config({
    this.environment,
    this.apiVersion,
  });
}
