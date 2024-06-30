import 'package:http/http.dart' as http;

Future<bool> registerRecruiter(
    String firstName,
    String lastName,
    String email,
    String nationalId,
    String address,
    String gender,
    String companyName,
    String company_description,
    String password) async {
  var url = Uri.parse('http://192.168.1.105:5000/auth/register');

  try {
    var response = await http.post(
      url,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'nationalId': nationalId,
        'address': address,
        'gender': gender,
        'companyName': companyName,
        'companyDescription': company_description,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print('Student registered successfully');
      return true;
    } else {
      print('Failed to register student: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error registering student: $e');
    return false;
  }
}
