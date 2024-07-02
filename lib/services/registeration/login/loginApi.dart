import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.105:5000';

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.105:5000/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Email': email,
          'Password': password,
        }),
      );

      print('Request payload: ${jsonEncode({'Email': email, 'Password': password})}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        responseData['success'] = true;
        return responseData;
      } else {
        return {'success': false, 'message': 'Invalid email or password'};
      }
    } catch (e) {
      print('Error during login: $e');
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
