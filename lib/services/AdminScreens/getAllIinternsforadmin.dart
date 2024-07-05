import 'dart:convert';
import 'package:http/http.dart' as http;

class Internship {
  final int internId;
  final String companyName;
  final String requirements;
  final String internTitle;
  final String city;
  final String country;
  final dynamic paid; // Adjust data type to dynamic or String
  final String internReqNo;
  final String date;
  final String duration;
  final String description;
  final int nationalId;
  final String? link;

  Internship({
    required this.internId,
    required this.companyName,
    required this.requirements,
    required this.internTitle,
    required this.city,
    required this.country,
    required this.paid,
    required this.internReqNo,
    required this.date,
    required this.duration,
    required this.description,
    required this.nationalId,
    this.link,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      internId: json['InternID'] ?? 0, // Provide a default value or handle null
      companyName: json['CompanyName'] ?? '',
      requirements: json['Requirements'] ?? '',
      internTitle: json['InternTitle'] ?? '',
      city: json['City'] ?? '',
      country: json['Country'] ?? '',
      paid: json['Paid'], // Adjust based on your API response
      internReqNo: json['InternReqNo'] ?? '',
      date: json['Date'] ?? '',
      duration: json['Duration'] ?? '',
      description: json['Description'] ?? '',
      nationalId: json['National_ID'] ?? 0, // Provide a default value or handle null
      link: json['Link'],
    );
  }
}


class FetchAllInternshipsService {
  Future<List<Internship>> fetchAllInternships() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.105:5000/Internships/all'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Internship> internships =
        data.map((json) => Internship.fromJson(json)).toList();
        return internships;
      } else {
        throw Exception('Failed to fetch internships: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch internships: $e');
    }
  }
}
