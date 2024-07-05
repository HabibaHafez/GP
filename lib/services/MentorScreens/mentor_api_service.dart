import 'dart:convert';
import 'package:http/http.dart' as http;

class MentorApiService {
  final String baseUrl = 'http://192.168.1.105:5000/auth';

  Future<bool> updateMentorProfile(int nationalId, Map<String, dynamic> profileData) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse('$baseUrl/updateMentorProfile'));
    request.body = json.encode(profileData);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
