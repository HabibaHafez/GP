import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileApiService {
  final String baseUrl = 'http://192.168.1.105:5000'; // Update with your actual base URL

  Future<Map<String, dynamic>?> getUserProfile(int nationalId) async {
    final url = Uri.parse('$baseUrl/auth/user/$nationalId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load user profile: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<String?> fetchUserImageUrl(int nationalId) async {
    // Implement the API endpoint to fetch the user's image URL if available
    // Assuming the endpoint is /auth/user/image/{nationalId}
    final url = Uri.parse('$baseUrl/auth/user/image/$nationalId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['imageUrl']; // Adjust according to your API response
    } else {
      print('Failed to fetch user image: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<void> uploadUserImage(int nationalId, File imageFile) async {
    final url = Uri.parse('$baseUrl/auth/user/upload_image/$nationalId');
    final request = http.MultipartRequest('POST', url);

    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image: ${response.reasonPhrase}');
    }
  }
}
