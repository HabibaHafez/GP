// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// //
// // class GroupChatService {
// //   static const String baseUrl = 'http://192.168.1.105:5000/groupMessages';
// //
// //   static Future<void> sendMessage(String senderId, String track, String content) async {
// //     var headers = {
// //       'Content-Type': 'application/json'
// //     };
// //     var request = http.Request('POST', Uri.parse('$baseUrl/send'));
// //     request.body = json.encode({
// //       "sender_id": senderId,
// //       "track": track,
// //       "content": content
// //     });
// //     request.headers.addAll(headers);
// //
// //     http.StreamedResponse response = await request.send();
// //
// //     if (response.statusCode == 200) {
// //       print(await response.stream.bytesToString());
// //     } else {
// //       throw Exception('Failed to send message: ${response.reasonPhrase}');
// //     }
// //   }
// //
// //   static Future<List<Map<String, dynamic>>> getMessages(String track) async {
// //     var request = http.Request('GET', Uri.parse('$baseUrl/messages/$track'));
// //     request.body = '''''';
// //
// //     http.StreamedResponse response = await request.send();
// //
// //     if (response.statusCode == 200) {
// //       List<dynamic> data = json.decode(await response.stream.bytesToString());
// //       return data.cast<Map<String, dynamic>>();
// //     } else {
// //       throw Exception('Failed to load messages: ${response.reasonPhrase}');
// //     }
// //   }
// // }
//
//

// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class GroupChatService {
//   static const String baseUrl = 'http://192.168.1.105:5000/groupMessages';
//
//   static Future<void> sendMessage(String senderId, String track, String content) async {
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var request = http.Request('POST', Uri.parse('$baseUrl/send'));
//     request.body = json.encode({
//       "sender_id": senderId,
//       "track": track,
//       "content": content
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       throw Exception('Failed to send message: ${response.reasonPhrase}');
//     }
//   }
//
//   static Future<List<Map<String, dynamic>>> getMessages(String track) async {
//     var request = http.Request('GET', Uri.parse('$baseUrl/messages/$track'));
//     request.body = '''''';
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(await response.stream.bytesToString());
//       return data.map((message) {
//         return {
//           'id': message['id'],
//           'sender_id': message['sender_id'],
//           'track': message['track'],
//           'content': message['content'],
//           'timestamp': message['timestamp'],
//           'first_name': message['first_name'],
//           'last_name': message['last_name'],
//         };
//       }).toList();
//     } else {
//       throw Exception('Failed to load messages: ${response.reasonPhrase}');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class GroupChatService {
  static const String baseUrl = 'http://192.168.1.105:5000/groupMessages';

  static Future<void> sendMessage(String senderId, String track, String content) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl/send'));
    request.body = json.encode({
      "sender_id": senderId,
      "track": track,
      "content": content
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw Exception('Failed to send message: ${response.reasonPhrase}');
    }
  }

  static Future<List<Map<String, dynamic>>> getMessages(String track) async {
    var request = http.Request('GET', Uri.parse('$baseUrl/messages/$track'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      if (responseBody.isEmpty) {
        return [];
      }
      List<dynamic> data = json.decode(responseBody);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load messages: ${response.reasonPhrase}');
    }
  }
}
