import 'dart:convert';
import 'package:http/http.dart' as http;

/// A service class to handle API calls.
class ApiService {
  final String baseUrl;

  /// Creates an instance of [ApiService] with the given [baseUrl].
  ApiService(this.baseUrl);

  /// Fetches data from the API endpoint '/api/hello'.
  ///
  /// Returns the response body as a string if the request is successful.
  /// Throws an [Exception] if the request fails.
  Future<String> getHomePageData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/event/homeEvents'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // Handle the different status codes if needed
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other type of exception
      throw Exception('Failed to load data: $e');
    }
  }

  Future<String> getAllEvents() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/event/allEvents'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // Handle the different status codes if needed
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other type of exception
      throw Exception('Failed to load data: $e');
    }
  }

  Future<bool> isAdmin(String username) async {
    final response =
        await http.get(Uri.parse('$baseUrl/users/$username/is_admin'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['isAdmin'] ?? false;
    } else {
      throw Exception('Failed to check admin status');
    }
  }
}
