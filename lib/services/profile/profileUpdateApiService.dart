import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileUpdateApiService {
  final String _baseUrl = 'http://192.168.1.2:5000';

  Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
    final url = Uri.parse('$_baseUrl/auth/updateprofile');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedFields),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }
}
