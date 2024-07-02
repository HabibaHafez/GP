import 'dart:convert';
import 'package:http/http.dart' as http;
//
// class RecommendedCourseService {
//   static Future<List<RecommendedCourse>> fetchRecommendedCourses(String nationalId) async {
//     final response = await http.get(Uri.parse('http://192.168.1.105:5000/recommend/course/$nationalId'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => RecommendedCourse.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load recommended courses');
//     }
//   }
// }
//
// class RecommendedCourse {
//   final String courseName;
//   final String provider;
//
//   RecommendedCourse({required this.courseName, required this.provider});
//
//   factory RecommendedCourse.fromJson(Map<String, dynamic> json) {
//     return RecommendedCourse(
//       courseName: json['CourseName'],
//       provider: json['Provider'],
//     );
//   }
// }

class RecommendedCourseService {
  static Future<List<RecommendedCourse>> fetchRecommendedCourses(String nationalId) async {
    final response = await http.get(Uri.parse('http://192.168.1.105:5000/recommend/course/$nationalId'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => RecommendedCourse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recommended courses');
    }
  }
}

class RecommendedCourse {
  final int courseId;
  final String courseName;
  final String duration;
  final String level;
  final String provider;
  final String link;
  final String paid;
  final String trackType;
  final String roadMap;

  RecommendedCourse({
    required this.courseId,
    required this.courseName,
    required this.duration,
    required this.level,
    required this.provider,
    required this.link,
    required this.paid,
    required this.trackType,
    required this.roadMap,
  });

  factory RecommendedCourse.fromJson(Map<String, dynamic> json) {
    return RecommendedCourse(
      courseId: json['CourseID'],
      courseName: json['CourseName'],
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


