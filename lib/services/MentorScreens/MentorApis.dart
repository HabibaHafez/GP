import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://192.168.1.105:5000';

  Future<int> fetchStudentCount(int mentorId) async {
    var url = Uri.parse('$baseUrl/enrollments/$mentorId/students/count');
    try {
      var response = await http.get(url);
      print('fetchStudentCount response: ${response.statusCode}, ${response.body}');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['enrolled_students_count'];
      } else {
        throw Exception('Failed to load student count');
      }
    } catch (e) {
      print('Error fetching student count: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchStudents(int mentorId) async {
    var url = Uri.parse('$baseUrl/enrollments/mentors/$mentorId/students');
    try {
      var response = await http.get(url);
      print('fetchStudents response: ${response.statusCode}, ${response.body}');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      print('Error fetching students: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchMeetings(int mentorId) async {
    var url = Uri.parse('$baseUrl/auth/meetings/$mentorId');
    try {
      var response = await http.get(url);
      print('fetchMeetings response: ${response.statusCode}, ${response.body}');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Failed to load meetings');
      }
    } catch (e) {
      print('Error fetching meetings: $e');
      rethrow;
    }
  }

  Future<String> fetchMeetingTime(int mentorId, String studentName) async {
    final response = await http.get(Uri.parse('$baseUrl/auth/meetings/$mentorId'));
    if (response.statusCode == 200) {
      List meetingsList = json.decode(response.body);
      for (var meeting in meetingsList) {
        if (meeting['Student_Name'] == studentName) {
          return '${meeting['Date']} at ${meeting['Time']}';
        }
      }
      return 'No meeting scheduled';
    } else {
      return 'No meeting scheduled';
    }
  }

  Future<List> fetchMentorExperience(int mentorId) async {
    final response = await http.get(Uri.parse('$baseUrl/mentors/$mentorId/experiences'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load mentor experience');
      throw Exception('Failed to load mentor experience');
    }
  }

  Future<void> addMentorExperience(int mentorId, String experience) async {
    final response = await http.post(
      Uri.parse('$baseUrl/mentors/$mentorId/experiences'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'experience': experience}),
    );
    if (response.statusCode != 200) {
      print('Failed to add mentor experience');
      throw Exception('Failed to add mentor experience');
    }
  }

  Future<void> deleteMentorExperience(int mentorId, String experience) async {
    final url = Uri.parse('$baseUrl/mentors/delete-experience');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'National_ID': mentorId.toString(), 'experience': experience});

    final response = await http.delete(url, headers: headers, body: body);

    print('Request URL: $url');
    print('Request headers: $headers');
    print('Request body: $body');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      print('Failed to delete mentor experience: ${response.body}');
      throw Exception('Failed to delete mentor experience');
    }
  }

  Future<Map<String, dynamic>?> getMentorProfile(int mentorId) async {
    final response = await http.get(Uri.parse('$baseUrl/mentors/$mentorId/profile'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load mentor profile');
      return null;
    }
  }

  Future<void> updateMentorProfile(int mentorId, Map<String, dynamic> profileData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/mentors/$mentorId/profile'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(profileData),
    );
    if (response.statusCode != 200) {
      print('Failed to update mentor profile');
      throw Exception('Failed to update mentor profile');
    }
  }
}
