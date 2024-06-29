// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class CourseApiService {
//   static const String baseUrl = 'http://localhost:5000';

//   Future<List<Course>> fetchCourses(String nationalId) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/takes/enroll$nationalId'));

//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         return data.map((course) => Course.fromJson(course)).toList();
//       } else {
//         throw Exception('Failed to load courses');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load courses');
//     }
//   }
// }

// // class Course {
// //   final String name;
// //   final String level;

// //   Course({required this.name, required this.level});

// //   factory Course.fromJson(Map<String, dynamic> json) {
// //     return Course(
// //       name: json['CourseName'],
// //       level: json['Level'],
// //     );
// //   }
// // }
