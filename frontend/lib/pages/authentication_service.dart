import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
  static const String baseUrl = 'http://localhost:8080'; // Connecting to url

  Future<bool> register(String username, String password) async {
    // Check if the username and password match a record in the database
    bool loginResult = await login(username, password);
    if (loginResult) {
      // If login successful, return true to indicate successful login without registration
      return true;
    }

    // Fetch all users from the database
    final response = await http.get(
      Uri.parse('$baseUrl/user/allUsers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);

      // Check if the username already exists
      bool usernameExists = users.any((user) => user['userName'] == username);
      if (usernameExists) {
        // Username exists, now check if the password matches
        var userData = users.firstWhere((user) => user['userName'] == username);
        if (userData['password'] == password) {
          // Username and password match, return true to indicate successful login
          return true;
        } else {
          // Username exists but password doesn't match, return false
          return false;
        }
      } else {
        // Username doesn't exist, proceed with registration
        final response = await http.post(
          Uri.parse('$baseUrl/user/addUser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'userName': username,
            'password': password,
            'adminPowers': false,
          }),
        );

        if (response.statusCode == 200) {
          // Registration successful
          return true;
        } else {
          // Registration failed
          return false;
        }
      }
    } else {
      // Failed to fetch users from the database
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/allUsers'), // Endpoint to view all users
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {
        if (user['userName'] == username && user['password'] == password) {
          return true;
        }
      }
      return false; // If no matching user found
    } else {
      return false; // Request failed
    }
  }

  Future<Map<String, dynamic>> getUserData(String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$username'), //Endpoint to get user data
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
