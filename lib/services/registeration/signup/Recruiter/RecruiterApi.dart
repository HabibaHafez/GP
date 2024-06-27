import 'package:http/http.dart' as http;

Future<void> registerRecruiter(String firstName, String lastName, String email, String nationalId, String address, String gender, String companyName,String company_description,String password) async {
  var url = Uri.parse('https://your-api-url/signup/student');

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
        'companyName':companyName,
        'companyDescription':company_description,
        'password': password,
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