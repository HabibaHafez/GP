import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://84.233.103.112:5000/auth/login';

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        responseData['success'] = true;
        return responseData;
      } else {
        return {
          'success': false,
          'message': 'Invalid email or password'
        };
      }
    } catch (e) {
      print('Error: $e');
      return {
        'success': false,
        'message': 'An error occurred'
      };
    }
  }
}
