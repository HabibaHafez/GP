
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

//
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
//     final url = Uri.parse('$_baseUrl/auth/updateProfile');
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
//
//   Future<bool> updateSkills(int nationalId, List<String> skills,
//       String action) async {
//     final url = Uri.parse('$_baseUrl/auth/updateSkills');
//
//     try {
//       final response = await http.put(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'nationalId': nationalId,
//           'skills': skills,
//           'action': action
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         print('Failed to update skills: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       print('Error updating skills: $e');
//       return false;
//     }
//   }
//
//
//   Future<bool> updateAreaOfInterest(int nationalId, List<String> areaOfInterest,
//       String action) async {
//     final url = Uri.parse('$_baseUrl/auth/updateTrack');
//
//     try {
//       final response = await http.put(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'nationalID': nationalId,
//           'areaOfInterest': areaOfInterest,
//           'action': action,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         print('Failed to update area of interest: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       print('Error updating area of interest: $e');
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


  Future<List<Map<String, dynamic>>?> getMentorExperiences(String id) async {
    final url = Uri.parse('$_baseUrl/mentors/$id/experiences');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Map<String, dynamic>> experiences =
        data.map((item) => item as Map<String, dynamic>).toList();
        return experiences;
      } else {
        print('Failed to load mentor experiences: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error loading mentor experiences: $e');
      return null;
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
    final url = Uri.parse('$_baseUrl/auth/updateStudentProfile');

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

  Future<bool> updateSkills(
      int nationalId, List<String> skills, String action) async {
    final url = Uri.parse('$_baseUrl/auth/updateSkills');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'nationalId': nationalId, 'skills': skills, 'action': action}),
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
