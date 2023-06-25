import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../objects/response/response.dart';

/// Handles low-level get and post calls to the api.
class Connection {
  Config config;
  late String baseUrl;
  late http.Client client;

  Connection(this.config) {
    baseUrl = config.environment.toString();
    client = http.Client();
  }

  /// Get without params
  Future<ApiResponse> get(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + endpoint),
        headers: {'accept': 'application/json'},
      );
      return ApiResponse(
        response.statusCode,
        json.decode(response.body),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Get with params
  Future<ApiResponse> getWithQueryParams(
    String endpoint,
    String queryString,
  ) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + endpoint + queryString),
        headers: {'accept': 'application/json'},
      );
      return ApiResponse(
        response.statusCode,
        json.decode(response.body),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Post with payload
  Future<ApiResponse> post(String endpoint, final payload) async {
    try {
      final response = await client.post(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'accept': 'application/json',
          'content-type': 'application/json',
        },
        body: json.encode(payload),
      );
      return ApiResponse(
        response.statusCode,
        json.decode(response.body),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Close the client
  void close() {
    client.close();
  }
}
