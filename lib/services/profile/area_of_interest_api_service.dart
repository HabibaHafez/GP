import 'dart:convert';
import 'package:http/http.dart' as http;

class AreaOfInterestApiService {
  final String _baseUrl = 'http://192.168.1.105:5000';

  Future<bool> updateAreaOfInterest(int nationalId, List<String> areaOfInterest, String action) async {
    final url = Uri.parse('$_baseUrl/auth/updateTrack');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nationalID': nationalId,
          'areaOfInterest': areaOfInterest,
          'action': action,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update area of interest: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating area of interest: $e');
      return false;
    }
  }
}

