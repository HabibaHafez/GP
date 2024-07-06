import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MentorMessageService {
  static const String baseUrl = 'http://192.168.1.105:5000/mentorMessages';
  static const String socketUrl = 'http://192.168.1.105:5000';

  IO.Socket? socket;

  MentorMessageService() {
    // Initialize Socket.io connection
    socket = IO.io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  Future<List<Message>> getMessagesToMentor(int mentorId) async {
    try {
      final response =
      await http.get(Uri.parse('$baseUrl/mentor-messages/$mentorId'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<Message> messages = [];

        for (var item in jsonList) {
          messages.add(Message.fromJson(item));
        }

        return messages;
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<void> sendMessage({
    required int senderId,
    required int receiverId,
    required String content,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'sender_id': senderId,
          'receiver_id': receiverId,
          'content': content,
        }),
      );

      if (response.statusCode == 201) {
        print('Message sent successfully');
        // Send message via Socket.io
        socket!.emit('sendMessage', {
          'sender_id': senderId,
          'receiver_id': receiverId,
          'content': content,
        });
      } else {
        print('Failed to send message: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to send message: $e');
      throw Exception('Failed to send message: $e');
    }
  }
}

class Message {
  final int senderId;
  final String firstName;
  final String lastName;
  final List<String> messages;

  Message({
    required this.senderId,
    required this.firstName,
    required this.lastName,
    required this.messages,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['sender_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      messages: List<String>.from(json['messages']),
    );
  }
}
