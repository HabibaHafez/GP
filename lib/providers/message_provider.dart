import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:techmate/services/chats/message.dart';

class MessageProvider extends ChangeNotifier {
  final MessageService _messageService = MessageService();

  IO.Socket? _socket;
  final Map<String, List<Message>> _mentorMessages = {};

  MessageProvider() {
    _socket = IO.io('http://192.168.174.2:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket!.on('message', (data) {
      final parsedMessage = Message.fromJson(json.decode(data));
      receiveMessage(parsedMessage);
    });

    _socket!.connect();
  }

  void fetchMessages(String currentUserId, String mentorId) {
    _messageService
        .fetchMessages(currentUserId, mentorId)
        .then((fetchedMessages) {
      _mentorMessages[mentorId] = fetchedMessages;
      notifyListeners();
    }).catchError((error) {
      print('Error fetching messages: $error');
    });
  }

  void sendMessage(Message message) {
    print('Sending message: ${message.toJson()}');
    _messageService.sendMessage(message).then((_) {
      _mentorMessages.update(message.receiverId.toString(), (existingMessages) {
        return [...existingMessages, message];
      }, ifAbsent: () => [message]);
      notifyListeners();
    }).catchError((error) {
      print('Error sending message: $error');
    });
  }

  void receiveMessage(Message message) {
    _mentorMessages.update(message.senderId.toString(), (existingMessages) {
      return [...existingMessages, message];
    }, ifAbsent: () => [message]);
    notifyListeners();
  }

  List<Message> getMessagesForMentor(String mentorId) {
    return _mentorMessages[mentorId] ?? [];
  }

  @override
  void dispose() {
    _socket!.disconnect();
    super.dispose();
  }
}
