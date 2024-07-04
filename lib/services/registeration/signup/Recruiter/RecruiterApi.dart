import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> registerRecruiter(
    String firstName,
    String lastName,
    String email,
    String nationalId,
    String gender,
    String password,
    String companyName,
    String jobTitle) async {
  var url = Uri.parse('http://192.168.1.105:5000/auth/register/recruiter');

  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'National_ID': nationalId,
        'Email': email,
        'Password': password,
        'first_name': firstName,
        'last_name': lastName,
        'Gender': gender,
        'Company_Name': companyName,
        'JobTitle': jobTitle,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Recruiter registered successfully');
      return true;
    } else {
      print('Failed to register recruiter: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error registering recruiter: $e');
    return false;
  }
}
