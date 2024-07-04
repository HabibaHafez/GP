import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteInternshipService {
  static const String baseUrl = 'http://192.168.1.105:5000//internships/recruiter/';

  Future<bool> deleteInternship(int internId, int nationalId) async {
    final url = '$baseUrl$internId';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({"nationalId": nationalId});

    final response = await http.delete(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
