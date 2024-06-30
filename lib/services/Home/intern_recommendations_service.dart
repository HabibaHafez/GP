import 'dart:convert';
import 'package:http/http.dart' as http;

class InternRecommendationsService {
  final String baseUrl = "http://84.233.111.206:5000/internships"; // Update with your actual endpoint

  Future<List<Map<String, dynamic>>> fetchRecommendations(String userId, {String? searchTerm}) async {
    try {
      final uri = searchTerm != null && searchTerm.isNotEmpty
          ? Uri.parse('$baseUrl/search?InternTitle=$searchTerm')
          : Uri.parse('$baseUrl/recommend/$userId');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load recommendations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to fetch recommendations: $e');
    }
  }
}
