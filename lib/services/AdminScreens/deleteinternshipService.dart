import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteInternshipService {
  static const String baseUrl = 'http://192.168.1.105:5000/internships';

  Future<bool> deleteInternship(int internId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$internId'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete internship');
    }
  }
}
