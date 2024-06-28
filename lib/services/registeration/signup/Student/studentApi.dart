import 'package:http/http.dart' as http;

Future<void> registerStudent(String firstName, String lastName, String email, String nationalId, String address, String gender, String level,String password,String areaOfInterest) async {
  var url = Uri.parse('http://localhost:5000/auth/register');

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
        'level':level,
        'password': password,
        'areaOfInterst':areaOfInterest,
      },
    );

    if (response.statusCode == 200) {
      print('Student registered successfully');
      
    } else {
      
      print('Failed to register student: ${response.statusCode}');
      
    }
  } catch (e) {
    
    print('Error registering student: $e');
    
  }
}
