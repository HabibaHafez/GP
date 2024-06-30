import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileApiService {
  static const String baseUrl = 'http://192.168.1.2:5000/auth/user';

  Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
    final response = await http.get(Uri.parse('$baseUrl/$nationalId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedFields),
    );

    return response.statusCode == 200;
  }
}
