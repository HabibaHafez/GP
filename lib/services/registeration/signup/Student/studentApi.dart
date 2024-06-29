import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> registerStudent(String firstName, String lastName, String email, String nationalId, String address, String gender, String level,String password,String areaOfInterest) async {
  var url = Uri.parse('https://your-api-url/signup/student');

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
