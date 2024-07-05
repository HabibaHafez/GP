import 'dart:convert';
import 'package:http/http.dart' as http;

class AddInternshipApiService {
  static const String apiUrl =
      'http://192.168.1.105:5000/recruiter/createInternship';

  static Future<bool> createInternship(Map<String, dynamic> requestBody) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Internship created successfully
        return true;
      } else {
        // Error occurred while creating the internship
        print('Failed to create internship: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Exception occurred
      print('Failed to create internship: $e');
      return false;
    }
  }
}
