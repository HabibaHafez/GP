import 'dart:convert';

import 'package:http/http.dart' as http;

class MentorRating {
  final int ratingId;
  final int studentId;
  final int mentorId;
  final int rating;
  final String comment;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final int noOfStudents;
  final double? averageRating;

  MentorRating({
    required this.ratingId,
    required this.studentId,
    required this.mentorId,
    required this.rating,
    required this.comment,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.noOfStudents,
    this.averageRating,
  });

  factory MentorRating.fromJson(Map<String, dynamic> json) {
    return MentorRating(
      ratingId: json['Rating_ID'] ?? 0,
      studentId: json['Student_ID'] ?? 0,
      mentorId: json['Mentor_ID'] ?? 0,
      rating: json['Rating'] ?? 0,
      comment: json['Comment'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      jobTitle: json['jobtitle'] ?? '',
      noOfStudents: json['No_of_Students'] ?? 0,
      averageRating: json['averageRating'] != null
          ? double.tryParse(json['averageRating'].toString())
          : null,
    );
  }
}

class RatingService {
  static const String _baseUrl = 'http://192.168.1.105:5000';

  Future<List<MentorRating>> getMentorsWithRatingsSorted() async {
    final url = Uri.parse('$_baseUrl/ratings/all-mentor-ratings');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mentorsJson = jsonDecode(response.body);
      List<MentorRating> mentors =
      mentorsJson.map((json) => MentorRating.fromJson(json)).toList();

      // Sort mentors by averageRating in ascending order
      mentors.sort(
              (a, b) => (a.averageRating ?? 0).compareTo(b.averageRating ?? 0));

      return mentors;
    } else {
      throw Exception('Failed to load mentors with ratings');
    }
  }

  Future<void> rateMentor(
      int studentId, int mentorId, int rating, String comment) async {
    final url = Uri.parse('$_baseUrl/ratings/rate-mentor');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'Student_ID': studentId,
        'Mentor_ID': mentorId,
        'Rating': rating,
        'Comment': comment,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to submit rating: ${response.body}');
    }
  }

  // Method to fetch mentors by AreaOfInterest
  Future<List<MentorRating>> searchMentorsByAreaOfInterest(
      String areaOfInterest) async {
    final url =
    Uri.parse('$_baseUrl/mentors/search?AreaOfInterest=$areaOfInterest');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic mentorsJson = jsonDecode(response.body);

      // Check if mentorsJson is a List or a single Map
      if (mentorsJson is List) {
        List<MentorRating> mentors =
        mentorsJson.map((json) => MentorRating.fromJson(json)).toList();
        return mentors;
      } else if (mentorsJson is Map<String, dynamic>) {
        // Handle single mentor case
        MentorRating mentor = MentorRating.fromJson(mentorsJson);
        return [mentor]; // Return as a list
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception(
          'Failed to search mentors by area of interest: ${response.body}');
    }
  }
}
