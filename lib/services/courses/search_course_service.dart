// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class SearchCourseService {
//   static Future<List<Course>> searchCourses(String RoadMap) async {
//     final response = await http.get(
//       Uri.parse('http://192.168.253.149:5000/courses/search/?RoadMap=$RoadMap'),
//     );
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Course.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load courses');
//     }
//   }
// }
//
// class Course {
//   final String courseName;
//   final String provider;
//   final String level;
//
//   Course({required this.courseName, required this.provider, required this.level});
//
//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       courseName: json['CourseName'],
//       provider: json['Provider'],
//       level: json['Level'],
//     );
//   }
// }

//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class SearchCourseService {
//   static Future<List<Course>> searchCourses(String RoadMap) async {
//     final response = await http.get(
//       Uri.parse('http://192.168.1.105:5000/courses/search/?RoadMap=$RoadMap'),
//     );
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Course.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load courses');
//     }
//   }
// }
//
// class Course {
//   final int courseId;
//   final String courseName;
//   final String duration;
//   final String level;
//   final String provider;
//   final String link;
//   final String paid;
//   final String trackType;
//   final String roadMap;
//
//   Course({
//     required this.courseId,
//     required this.courseName,
//     required this.duration,
//     required this.level,
//     required this.provider,
//     required this.link,
//     required this.paid,
//     required this.trackType,
//     required this.roadMap,
//   });
//
//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       courseId: json['CourseID'],
//       courseName: json['CourseName'],
//       duration: json['Duration'],
//       level: json['Level'],
//       provider: json['Provider'],
//       link: json['Link'],
//       paid: json['Paid'],
//       trackType: json['TrackType'],
//       roadMap: json['RoadMap'],
//     );
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchCourseService {
  static Future<List<Course>> fetchAllCourses() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.105:5000/courses/search/'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  static Future<List<Course>> searchCoursesByRoadMap(String roadMap) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.105:5000/courses/search/?RoadMap=$roadMap'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  static Future<List<Course>> searchCoursesByName(String courseName) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.105:5000/courses/search/?CourseName=$courseName'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}

class Course {
  final int courseId;
  final String courseName;
  final String duration;
  final String level;
  final String provider;
  final String link;
  final String paid;
  final String trackType;
  final String roadMap;

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
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
