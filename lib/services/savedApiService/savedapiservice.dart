import 'package:http/http.dart' as http;
import 'dart:convert';

class savedApiService {
  final String baseUrl = "http://192.168.1.105:5000"; // Ensure this IP address is correct

  Future<List<Map<String, dynamic>>> getSavedCourses(int nationalId) async {
    final response = await http.get(Uri.parse('$baseUrl/takes/saved/$nationalId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Map<String, dynamic>> savedCourses = body.map<Map<String, dynamic>>((item) {
        return {
          'type': 'course',
          'title': item['CourseName'] ?? '',
          'subtitle': item['RoadMap'] ?? '',
          'image': 'https://example.com/default_course_image.jpg', // Replace with actual image URL if available
        };
      }).toList();
      return savedCourses;
    } else {
      throw Exception('Failed to load saved courses');
    }
  }

  Future<List<Map<String, dynamic>>> getSavedInternships(int nationalId) async {
    final response = await http.get(Uri.parse('$baseUrl/apply/saved/$nationalId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Map<String, dynamic>> savedInternships = body.map<Map<String, dynamic>>((item) {
        return {
          'type': 'internship',
          'title': item['InternTitle'] ?? '',
          'subtitle': item['CompanyName'] ?? '',
          'image': 'https://example.com/default_internship_image.jpg', // Replace with actual image URL if available
        };
      }).toList();
      return savedInternships;
    } else {
      throw Exception('Failed to load saved internships');
    }
  }
}
