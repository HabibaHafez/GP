// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:techmate/services/RecruiterScreens/getAllinternsforRecuiter.dart';
//
// class UpdateInternshipApiService {
//   static const String _baseUrl = 'http://192.168.1.105:5000/recruiter/internship';
//
//   Future<bool> updateInternship(Internship internship) async {
//     final response = await http.put(
//       Uri.parse(_baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         "InternID": internship.internId,
//         "InternTitle": internship.internTitle,
//         "CompanyName": internship.companyName,
//         "Link": internship.link,
//         "InternReqNo": internship.internReqNo,
//         "Paid": internship.paid,
//         "Date": internship.date,
//         "Description": internship.description,
//         "Duration": internship.duration,
//         "Requirements": internship.requirements,
//         "City": internship.city,
//         "Country": internship.country,
//         "National_ID": 1234566304,
//       }),
//     );
//
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return true;
//     } else {
//       throw Exception('Failed to update internship: ${response.body}');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techmate/services/RecruiterScreens/getAllinternsforRecuiter.dart';

class UpdateInternshipApiService {
  static const String _baseUrl = 'http://192.168.1.105:5000/recruiter/internship';

  Future<bool> updateInternship(Internship internship) async {
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "InternID": internship.internId,
      "InternTitle": internship.internTitle,
      "CompanyName": internship.companyName,
      "Link": internship.link,
      "InternReqNo": internship.internReqNo,
      "Paid": internship.paid,
      "Date": internship.date,
      "Description": internship.description,
      "Duration": internship.duration,
      "Requirements": internship.requirements,
      "City": internship.city,
      "Country": internship.country,
      "National_ID": internship.nationalId,
    });

    final response = await http.put(
      Uri.parse(_baseUrl), // Endpoint remains the same as the base URL
      headers: headers,
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('Failed to update internship: ${response.body}');
      return false;
    }
  }
}
