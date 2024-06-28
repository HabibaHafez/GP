import 'dart:convert';
import 'package:http/http.dart' as http;

class MentorService {
  final String baseUrl = "http://localhost:5000/auth";

  Future<List<Mentor>> getMentors() async {
    final response = await http.get(Uri.parse('$baseUrl/mentors'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Mentor> mentors = body.map((dynamic item) => Mentor.fromJson(item)).toList();
      return mentors;
    } else {
      throw Exception('Failed to load mentors');
    }
  }
}

class Mentor {
  final int id;
  final String name;
  final String expertise;
  final String reviews;
  final double rating;
  final String image;

  Mentor({
    required this.id,
    required this.name,
    required this.expertise,
    required this.reviews,
    required this.rating,
    this.image = 'https://example.com/static_mentor_image.jpg',
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['id'],
      name: json['name'],
      expertise: json['expertise'],
      reviews: json['reviews'],
      rating: json['rating'].toDouble(),
    );
  }
}
