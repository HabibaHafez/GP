import 'dart:convert';
import 'package:http/http.dart' as http;

class Course {
  final int id;
  final String name;
  final String duration;
  final String level;
  final String provider;
  final String link;
  final bool paid;
  final String trackType;

  Course({
    required this.id,
    required this.name,
    required this.duration,
    required this.level,
    required this.provider,
    required this.link,
    required this.paid,
    required this.trackType,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['course_id'],
      name: json['course_name'],
      duration: json['course_duration'],
      level: json['level'],
      provider: json['provider'],
      link: json['link'],
      paid: json['paid'],
      trackType: json['tracktype'],
    );
  }
}


class CourseCategoryApiService {
  final String startedCoursesUrl = 'http://localhost:5000/internships/courseid';
  final String suggestedCoursesUrl = 'http://localhost:5000/takes/notTaken/';

  Future<List<Course>> fetchStartedCourses() async {
    final response = await http.get(Uri.parse(startedCoursesUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Course.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load started courses');
    }
  }

  Future<List<Course>> fetchSuggestedCourses(int nationalId) async {
    final response = await http.get(Uri.parse('$suggestedCoursesUrl$nationalId'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Course.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load suggested courses');
    }
  }
}
