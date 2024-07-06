// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class MessageService {
//   static const String baseUrl = 'http://192.168.1.105:5000';
//
//   Future<List<Message>> fetchMessages(
//       String currentUserId, String mentorId) async {
//     String url = '$baseUrl/messages/conversation/$currentUserId/$mentorId';
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       List<dynamic> jsonList = jsonDecode(response.body);
//       return jsonList.map((json) => Message.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch messages');
//     }
//   }
//
//   Future<void> sendMessage(Message message) async {
//     String url = '$baseUrl/messages/send';
//
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(message.toJson()),
//       );
//
//       if (response.statusCode == 201) {
//         print('Message sent successfully');
//       } else {
//         print('Failed to send message: ${response.body}');
//         throw Exception('Failed to send message');
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//       throw Exception('Failed to send message');
//     }
//   }
// }
//
// class Message {
//   final int senderId;
//   final int receiverId;
//   final String content;
//   final DateTime timestamp;
//
//   Message({
//     required this.senderId,
//     required this.receiverId,
//     required this.content,
//     required this.timestamp,
//   });
//
//   // Convert Message object to JSON format
//   Map<String, dynamic> toJson() {
//     return {
//       'sender_id': senderId,
//       'receiver_id': receiverId,
//       'content': content,
//       'timestamp': timestamp.toIso8601String(),
//     };
//   }
//
//   // Create Message object from JSON format
//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       senderId: json['sender_id'] as int,
//       receiverId: json['receiver_id'] as int,
//       content: json['content'] as String,
//       timestamp: DateTime.parse(json['timestamp'] as String),
//     );
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageService {
  static const String baseUrl = 'http://192.168.1.105:5000/messages';

  Future<List<Message>> getConversation({
    required int senderId,
    required int receiverId,
  }) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/conversation/$senderId/$receiverId'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<Message> messages = [];

        for (var item in jsonList) {
          messages.add(Message.fromJson(item));
        }

        return messages;
      } else {
        throw Exception('Failed to load conversation');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<void> sendMessage(Message message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(message.toJson()),
      );

      if (response.statusCode != 201) {
        print('Failed to send message: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}

class Message {
  final int senderId;
  final int receiverId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
