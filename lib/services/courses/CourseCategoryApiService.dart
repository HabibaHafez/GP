import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techmate/shared%20attributes/shared.dart';

class Course {
  final int id;
  final String name;
  final String duration;
  final String level;
  final String provider;
  final String link;
  final bool paid;
  final String trackType;
  final String roadMap;


  Course({
    required this.id,
    required this.name,
    required this.duration,
    required this.level,
    required this.provider,
    required this.link,
    required this.paid,
    required this.trackType,
    required this.roadMap,

  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['CourseID'],
      name: json['CourseName'],
      duration: json['Duration'],
      level: json['Level'],
      provider: json['Provider'],
      link: json['Link'],
      paid: json['Paid'],
      trackType: json['TrackType'],
      roadMap: json['RoadMap'],

    );
  }
}

class CourseApiService {
  static const String _baseUrl = 'http://192.168.1.2:5000';

  Future<List<Course>> fetchStartedCourses() async {
    final response = await http.get(Uri.parse('$_baseUrl/internships/courseid'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load started courses');
    }
  }

  Future<List<Course>> fetchSuggestedCourses(int nationalId) async {
    final response = await http.get(Uri.parse('$_baseUrl/takes/notTaken/$nationalId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load suggested courses');
    }
  }
}
