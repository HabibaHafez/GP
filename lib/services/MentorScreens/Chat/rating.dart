import 'dart:convert';

import 'package:http/http.dart' as http;

class MentorRatingService {
  static const String baseUrl = 'http://192.168.1.105:5000';

  // Method to update mentor rating
  static Future<void> rateMentor({
    required String studentId,
    required String mentorId,
    required int rating,
  }) async {
    final url = Uri.parse('$baseUrl/enrollments/rate');
    final body = jsonEncode({
      'Student_ID': studentId,
      'Mentor_ID': mentorId,
      'Ratings': rating,
    });

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Rating updated successfully');
      } else {
        print('Failed to update rating: ${response.statusCode}');
        throw Exception('Failed to update rating');
      }
    } catch (e) {
      print('Error updating rating: $e');
      throw Exception('Error updating rating: $e');
    }
  }
}
