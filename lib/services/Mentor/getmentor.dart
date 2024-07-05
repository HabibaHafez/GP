import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MentorService {
  final String baseUrl = "http://192.168.1.105:5000/auth";

  Future<List<Mentor>> getMentors() async {
    final response = await http.get(Uri.parse('$baseUrl/mentors'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Mentor> mentors =
          body.map((dynamic item) => Mentor.fromJson(item)).toList();
      return mentors;
    } else {
      throw Exception('Failed to load mentors');
    }
  }
}

class Mentor {
  final int id;
  final String firstname;
  final int? price; // Making price nullable
  final String jobtitle;

  Mentor({
    required this.id,
    required this.jobtitle,
    required this.firstname,
    this.price, // Nullable parameter
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['National_ID'] ??
          0, // Example default value if 'NationalID' is null
      price: json['Price'] ?? null, // Use null if JSON value is null
      jobtitle: json['JobTitle'] ?? '',
      firstname:
          json['first_name'], // Example default value or handle null case
    );
  }
}
