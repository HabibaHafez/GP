//
//
//
// // profile_api_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ProfileApiService {
//   static const String baseUrl = 'http://192.168.1.105:5000/auth/user';
//
//   Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
//     final response = await http.get(Uri.parse('$baseUrl/$nationalId'));
//
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }
//
//   Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
//     final response = await http.put(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(updatedFields),
//     );
//
//     return response.statusCode == 200;
//   }
// }

// profileApiService.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ProfileApiService {
  static const String baseUrl = 'http://192.168.1.105:5000';

  Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
    final response = await http.get(Uri.parse('$baseUrl/auth/user/$nationalId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> updatedFields) async {
    final response = await http.put(
      Uri.parse('$baseUrl/auth/user'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedFields),
    );

    return response.statusCode == 200;
  }

  Future<bool> uploadUserImage(int userId, File image) async {
    var uri = Uri.parse('$baseUrl/userImages/uploadUserImage');
    var request = http.MultipartRequest('POST', uri)
      ..fields['userId'] = userId.toString()
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      var responseData = await response.stream.bytesToString();
      print('Image upload failed with status: ${response.statusCode}');
      print('Response: $responseData');
      return false;
    }
  }

  Future<String?> fetchUserImageUrl(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/userImages/getUserImage/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['image_url']; // Update this according to your API response
    }
    return null;
  }
}
