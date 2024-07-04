import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List> fetchStudents(int mentorId) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/enrollments/$mentorId/students'));
    if (response.statusCode == 200) {
      List studentsList = json.decode(response.body);
      for (var student in studentsList) {
        student['meeting_time'] = await fetchMeetingTime(mentorId, student['Student_Name']);
      }
      return studentsList;
    } else {
      print('Failed to load students');
      throw Exception('Failed to load students');
    }
  }

  Future<int> fetchStudentCount(int mentorId) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/enrollments/$mentorId/students/count'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['count'];
    } else {
      print('Failed to load student count');
      throw Exception('Failed to load student count');
    }
  }

  Future<String> fetchMeetingTime(int mentorId, String studentName) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/auth/meetings/$mentorId'));
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

  Future<List> fetchMeetings(int mentorId) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/auth/meetings/$mentorId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load meetings');
      throw Exception('Failed to load meetings');
    }
  }

  Future<List> fetchMentorExperience(int mentorId) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/mentors/$mentorId/experiences'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load mentor experience');
      throw Exception('Failed to load mentor experience');
    }
  }

  Future<void> addMentorExperience(int mentorId, String experience) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.105:5000/mentors/$mentorId/experiences'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'experience': experience}),
    );
    if (response.statusCode != 200) {
      print('Failed to add mentor experience');
      throw Exception('Failed to add mentor experience');
    }
  }

  Future<Map<String, dynamic>?> getMentorProfile(int mentorId) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/mentors/$mentorId/profile'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load mentor profile');
      return null;
    }
  }

  Future<void> updateMentorProfile(int mentorId, Map<String, dynamic> profileData) async {
    final response = await http.put(
      Uri.parse('http://192.168.1.105:5000/mentors/$mentorId/profile'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(profileData),
    );
    if (response.statusCode != 200) {
      print('Failed to update mentor profile');
      throw Exception('Failed to update mentor profile');
    }
  }
}
