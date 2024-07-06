import 'dart:convert';

import 'package:http/http.dart' as http;

class MentorService {
  final String baseUrl = "http://192.168.1.105:5000/auth";
  final String userImagesUrl = "http://192.168.1.105:5000/userImages";
  final String mentorUrl = "http://192.168.1.105:5000/mentors";

  Future<List<Mentor>> getMentors() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/mentors'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Mentor> mentors = [];

        for (var item in body) {
          Mentor mentor = Mentor.fromJson(item);
          mentor.imageUrl = await _fetchMentorImage(mentor.id.toString());
          mentor.experience =
          (await _fetchMentorExperience(mentor.id.toString()))!;
          mentors.add(mentor);
        }

        return mentors;
      } else {
        throw Exception('Failed to load mentors');
      }
    } catch (e) {
      print('Error fetching mentors: $e');
      throw Exception('Failed to load mentors');
    }
  }

  Future<String> _fetchMentorImage(String id) async {
    try {
      final response =
      await http.get(Uri.parse('$userImagesUrl/getUserImage/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data['image_url'];
      } else {
        return '';
      }
    } catch (e) {
      print('Error fetching mentor image: $e');
      return '';
    }
  }

  Future<List<String>?> _fetchMentorExperience(String id) async {
    try {
      final response =
      await http.get(Uri.parse('$mentorUrl/mentors/$id/experiences'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<String>? experiences =
        data.map((item) => item['Experience']).cast<String>().toList();
        return experiences;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching mentor experiences: $e');
      return [];
    }
  }

  Future<List<Mentor>> searchMentorsByAreaOfInterest(
      String areaOfInterest) async {
    final response = await http.get(
      Uri.parse('$mentorUrl/search?AreaOfInterest=$areaOfInterest'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Mentor> mentors = data.map((json) => Mentor.fromJson(json)).toList();
      return mentors;
    } else {
      throw Exception('Failed to load mentors');
    }
  }
}

class Mentor {
  final int id;
  final String firstname;
  final String lastname;
  final String jobtitle;
  final int? price;
  String? imageUrl;
  List<String> experience;

  Mentor({
    required this.id,
    required this.jobtitle,
    required this.firstname,
    required this.lastname,
    this.price,
    this.imageUrl,
    required this.experience,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
        id: json['National_ID'] ?? 0,
        firstname: json['first_name'] ?? '',
        lastname: json['last_name'] ?? '',
        jobtitle: json['JobTitle'] ?? '',
        price: json['Price'],
        experience: []);
  }
}
