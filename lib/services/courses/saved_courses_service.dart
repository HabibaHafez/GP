// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class SavedCourse {
//   final String courseName;
//   final String provider;
//
//   SavedCourse({required this.courseName, required this.provider});
//
//   factory SavedCourse.fromJson(Map<String, dynamic> json) {
//     return SavedCourse(
//       courseName: json['CourseName'],
//       provider: json['Provider'],
//     );
//   }
// }
//
// class SavedCoursesService {
//   static Future<List<SavedCourse>> fetchSavedCourses(String nationalId) async {
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var request = http.Request('GET', Uri.parse('http://192.168.253.149:5000/takes/saved/$nationalId'));
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(await response.stream.bytesToString());
//       return data.map((json) => SavedCourse.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load saved courses');
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class SavedCourse {
  final int courseId;
  final String courseName;
  final String duration;
  final String level;
  final String provider;
  final String link;
  final String paid;
  final String trackType;
  final String roadMap;

  SavedCourse({
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

  factory SavedCourse.fromJson(Map<String, dynamic> json) {
    return SavedCourse(
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

class SavedCoursesService {
  static Future<List<SavedCourse>> fetchSavedCourses(String nationalId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://192.168.1.105:5000/takes/saved/$nationalId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(await response.stream.bytesToString());
      return data.map((json) => SavedCourse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load saved courses');
    }
  }
}
