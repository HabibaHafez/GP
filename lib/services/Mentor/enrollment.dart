import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EnrollService {
  static const String baseUrl =
      'http://192.168.1.105:5000'; // Replace with your actual backend URL

  static Future<bool> enrollStudentWithMentor(
      int studentId, int mentorId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? studentId = prefs.getInt('national_id');

      final response = await http.post(
        Uri.parse('$baseUrl/enrollments/enroll'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'Student_ID': studentId,
          'Mentor_ID': mentorId,
        }),
      );

      if (response.statusCode == 201) {
        return true; // Enrollment successful
      } else {
        return false; // Enrollment failed
      }
    } catch (e) {
      print('Error enrolling student: $e');
      return false;
    }
  }
}