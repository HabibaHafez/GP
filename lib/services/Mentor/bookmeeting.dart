import 'dart:convert';

import 'package:http/http.dart' as http;

class BookingService {
  final String baseUrl = "http://192.168.1.105:5000/auth";

  // Booking a meeting
  Future<bool> bookMeeting({
    required int mentorId,
    required int studentId,
    required String date,
    required String duration,
  }) async {
    final url = Uri.parse('$baseUrl/bookMeeting');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'Mentor_ID': mentorId,
      'Student_ID': studentId,
      'Date': date,
      'Duration': duration,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        bool updated = await updateScheduledNationalID(studentId, mentorId);
        return updated;
      } else {
        print('Failed to book meeting: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error booking meeting: $e');
      return false;
    }
  }

  // Updating Scheduled National ID
  Future<bool> updateScheduledNationalID(int studentId, int mentorId) async {
    final updateUrl = Uri.parse('$baseUrl/updateScheduledNationalID');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'Student_ID': studentId,
      'Mentor_ID': mentorId,
    });

    try {
      final response = await http.put(updateUrl, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update Scheduled_nationalID: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating Scheduled_nationalID: $e');
      return false;
    }
  }

  // Getting Student Bookings
  Future<List<Booking>> getStudentBookings(int studentId) async {
    final url = Uri.parse('$baseUrl/bookings/$studentId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<Booking> bookings =
        jsonList.map((e) => Booking.fromJson(e)).toList();
        return bookings;
      } else {
        throw Exception('Failed to load student bookings');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

// Booking Model
class Booking {
  final String mentorName;
  final String date;
  final String duration;

  Booking(
      {required this.mentorName, required this.date, required this.duration});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      mentorName: json['Mentor_Name'],
      date: json['Date'],
      duration: json['Time'],
    );
  }
}
