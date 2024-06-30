
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ProfileUpdateApiService {
//   final String _baseUrl = 'http://192.168.1.105:5000';
//
//   Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
//     final url = Uri.parse('$_baseUrl/auth/user/$nationalId');
//
//     try {
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         print('Failed to load profile: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error loading profile: $e');
//       return null;
//     }
//   }
//
//   Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
//     final url = Uri.parse('$_baseUrl/auth/updateprofile');
//
//     try {
//       final response = await http.put(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(updatedFields),
//       );
//
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         print('Failed to update profile: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       print('Error updating profile: $e');
//       return false;
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileUpdateApiService {
  final String _baseUrl = 'http://192.168.1.105:5000';

  Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
    final url = Uri.parse('$_baseUrl/auth/user/$nationalId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to load profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error loading profile: $e');
      return null;
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
    final url = Uri.parse('$_baseUrl/auth/updateProfile');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedFields),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }

  Future<bool> updateSkills(int nationalId, List<String> skills, String action) async {
    final url = Uri.parse('$_baseUrl/auth/updateSkills');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nationalId': nationalId,
          'skills': skills,
          'action': action
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update skills: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating skills: $e');
      return false;
    }
  }
}
