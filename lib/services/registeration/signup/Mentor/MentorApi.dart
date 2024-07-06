import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> registerMentor(
    String firstName,
    String lastName,
    String email,
    String nationalId,
    String gender,
    String jobTitle,
    String password,
    String areaOfInterest) async {
  var url = Uri.parse('http://192.168.1.105:5000/auth/register/mentor');

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'National_ID': nationalId,
        //'DoB': '1985-05-15', // Provide actual date of birth if available
        'Email': email,
        'Password': password,
        //'PhoneNumber': '+1987654321', // Provide actual phone number if available
        'Gender': gender,
        'first_name': firstName,
        'last_name': lastName,
        'JobTitle': jobTitle,
        'AreaOfInterest': areaOfInterest,
        //'No_of_Students': 5, // Provide actual number of students if available
        //'Price': 50, // Provide actual price if available
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Mentor registered successfully');
      return true;
    } else {
      print('Failed to register mentor: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error registering mentor: $e');
    return false;
  }
}
