/// Response from the API.
class ApiResponse {
  int statusCode;
  Map<String, dynamic> body;

  ApiResponse(this.statusCode, this.body);
}
