import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techmate/services/RecruiterScreens/getAllinternsforRecuiter.dart';

class SearchInternApiService {
  Future<List<Internship>> searchInternships(String title, int nationalId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.105:5000/internships/recruiter/search?title=$title&national_id=$nationalId'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Internship> internships = data.map((json) => Internship.fromJson(json)).toList();
        return internships;
      } else {
        throw Exception('Failed to search internships: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to search internships: $e');
    }
  }
}
