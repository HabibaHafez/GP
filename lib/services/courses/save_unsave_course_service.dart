import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveUnsaveCourseService {
  static Future<void> saveCourse(String nationalId, int courseId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://192.168.1.105:5000/takes/save'));
    request.body = json.encode({
      "National_ID": nationalId,
      "CourseID": courseId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to save course');
    }
  }

  static Future<void> unsaveCourse(String nationalId, int courseId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://192.168.1.105:5000/takes/unsave'));
    request.body = json.encode({
      "National_ID": nationalId,
      "CourseID": courseId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to unsave course');
    }
  }

  static Future<bool> isCourseSaved(String nationalId, int courseId) async {
    var response = await http.get(
      Uri.parse('http://192.168.1.105:5000/takes/issaved/$nationalId/$courseId'),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['isSaved'] as bool;
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to check if course is saved');
    }
  }
}



