import 'dart:convert';
import 'package:http/http.dart' as http;

class InternRecommendationsService {
  final String baseUrl = "http://84.233.103.112:5000/internships/recommend";

  Future<List<Map<String, dynamic>>> fetchRecommendations(String userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$userId'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print('Fetched data: $data'); // Log the fetched data
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
