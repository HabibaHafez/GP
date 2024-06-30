import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseRecommendationService {
  final String baseUrl = "http://192.168.1.2:5000";

  Future<dynamic> getCourseRecommendation(String courseId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/recommend/course/$courseId'));

      if (response.statusCode == 200) {
        // Successful API call
        return json.decode(response.body);
      } else {
        // Handle other status codes here if needed
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any exceptions thrown during the API call
      print('Error: $e');
      return null;
    }
  }
}
