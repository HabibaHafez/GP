import 'package:http/http.dart' as http;

class DeleteMentorService {
  static const String _baseUrl = 'http://192.168.1.105:5000';

  // Method to delete a mentor
  Future<void> deleteMentor(int mentorId) async {
    final url = Uri.parse('$_baseUrl/mentors/delete-mentor/$mentorId');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete mentor: ${response.body}');
    }
  }
}
