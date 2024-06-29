import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> registerStudent(
    String firstName,
    String lastName,
    String email,
    String nationalId,
    String country,
    String gender,
    String level,
    String password,
    String areaOfInterest,
    String role) async {
  var url = Uri.parse('http://192.168.1.6:5000/auth/register');

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'National_ID': nationalId,
        'Email': email,
        'Password': password,
        'first_name': firstName,
        'last_name': lastName,
        'Gender': gender,
        'AreaOfInterest': areaOfInterest,
        'Level': level,
        'Country': country,
        'role': role,
      }),
    );

    if (response.statusCode == 200) {
      print('Student registered successfully');
      return true;
    } else {
      print('Failed to register student: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error registering student: $e');
    return false;
  }
}
