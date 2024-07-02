// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class InternRecommendationsService {
//   final String baseUrl = "http://192.168.1.105:5000/internships";
//
//   Future<List<Map<String, dynamic>>> fetchRecommendations(String userId, {String? searchTerm}) async {
//     try {
//       final uri = searchTerm != null && searchTerm.isNotEmpty
//           ? Uri.parse('$baseUrl/search?InternTitle=$searchTerm')
//           : Uri.parse('$baseUrl/recommend/$userId');
//
//       final response = await http.get(uri);
//
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         return List<Map<String, dynamic>>.from(data);
//       } else {
//         throw Exception('Failed to load recommendations. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error occurred: $e');
//       throw Exception('Failed to fetch recommendations: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class InternRecommendationsService {
  Future<List<Map<String, dynamic>>> fetchRecommendations(String userId) async {
    final url = Uri.parse('http://192.168.1.105:5000/internships/recommend/$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((internship) => internship as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load recommendations: ${response.statusCode}');
    }
  }
  final String baseUrl = "http://192.168.1.105:5000";

  Future<List<Map<String, dynamic>>> fetchAllInternships() async {
    final url = Uri.parse('$baseUrl/internships/search');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((internship) => internship as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load internships: ${response.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>> searchInternships(String title) async {
    final url = Uri.parse('$baseUrl/internships/search?InternTitle=$title');
    print('Fetching internships with title: $title');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print('Received data: ${data.length} items');
      return data.map((internship) => internship as Map<String, dynamic>).toList();
    } else {
      print('Failed to load internships: ${response.statusCode}');
      throw Exception('Failed to load internships: ${response.statusCode}');
    }
  }
}