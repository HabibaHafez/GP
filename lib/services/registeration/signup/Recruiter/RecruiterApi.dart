import 'package:http/http.dart' as http;

Future<bool> registerRecruiter(

    String firstName,
    String lastName,
    String email,
    String nationalId,
    String gender,
    String companyName,
    String password,
    String jobTitle) async {
  var url = Uri.parse('http://192.168.1.105:5000/auth/register');


  try {
    var response = await http.post(
      url,
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'Email': email,
        'National_ID': nationalId,
        'Gender': gender,
        'Company_Name': companyName,
        'JobTitle': jobTitle,
        'Password': password,
      },
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
