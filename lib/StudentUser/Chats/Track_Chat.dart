//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'dart:convert';
// import 'package:techmate/services/courses/group_chat_service.dart';
//
// class WritingMessageScreen extends StatefulWidget {
//   static const routeName = 'trackchat';
//   final String trackName;
//
//   WritingMessageScreen({required this.trackName});
//
//   @override
//   _WritingMessageScreenState createState() => _WritingMessageScreenState();
// }
//
// class _WritingMessageScreenState extends State<WritingMessageScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _controller = TextEditingController();
//   late IO.Socket socket;
//   String? senderId;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeSenderId().then((_) {
//       _connectSocket();
//       _fetchMessages();
//     });
//   }
//
//   void _connectSocket() {
//     socket = IO.io('http://192.168.1.105:5000', IO.OptionBuilder()
//         .setTransports(['websocket']) // for Flutter or Dart VM
//         .disableAutoConnect() // disable auto-connection
//         .build());
//
//     socket.connect();
//
//     socket.onConnect((_) {
//       print('connected');
//     });
//
//     socket.on('initialMessages', (data) {
//       final parsedMessage = json.decode(data);
//       if (parsedMessage['type'] == 'group' && parsedMessage['track'] == widget.trackName) {
//         if (!mounted) return; // Ensure widget is still mounted
//         setState(() {
//           if (_messages.isNotEmpty && _messages.last.senderId == parsedMessage['sender_id'].toString()) {
//             _messages.last.messages.add(parsedMessage['content']);
//           } else {
//             _messages.add(ChatMessage(
//               isUser: parsedMessage['sender_id'].toString() == senderId,
//               senderId: parsedMessage['sender_id'].toString(),
//               messages: [parsedMessage['content']],
//               firstName: parsedMessage['first_name'],
//               lastName: parsedMessage['last_name'],
//             ));
//           }
//         });
//       }
//     });
//
//     socket.onConnectError((data) {
//       print('Connection Error: $data');
//     });
//
//     socket.onError((data) {
//       print('Error: $data');
//     });
//   }
//
//   Future<void> _initializeSenderId() async {
//     senderId = await _getSenderId();
//     print('Sender ID initialized: $senderId'); // Debug log
//   }
//
//   Future<void> _fetchMessages() async {
//     try {
//       final messages = await GroupChatService.getMessages(widget.trackName);
//       if (!mounted) return; // Ensure widget is still mounted
//       setState(() {
//         for (var messageGroup in messages) {
//           _messages.add(ChatMessage(
//             isUser: messageGroup['sender_id'].toString() == senderId,
//             senderId: messageGroup['sender_id'].toString(),
//             messages: List<String>.from(messageGroup['messages']),
//             firstName: messageGroup['first_name'],
//             lastName: messageGroup['last_name'],
//           ));
//         }
//       });
//     } catch (e) {
//       print('Failed to fetch messages: $e');
//     }
//   }
//
//   Future<String?> _getSenderId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final id = prefs.get('national_id');
//     return id?.toString();
//   }
//
//   void _sendMessage() async {
//     if (_controller.text.isNotEmpty && senderId != null) {
//       final messageContent = _controller.text;
//       final message = {
//         'type': 'group',
//         'sender_id': senderId,
//         'track': widget.trackName,
//         'content': messageContent,
//       };
//
//       setState(() {
//         if (_messages.isNotEmpty && _messages.last.isUser) {
//           _messages.last.messages.add(messageContent);
//         } else {
//           _messages.add(ChatMessage(
//             isUser: true,
//             senderId: senderId!,
//             messages: [messageContent],
//             firstName: 'Me', // or fetch your own profile if needed
//             lastName: '',
//           ));
//         }
//         _controller.clear();
//       });
//
//       // Send the message to the backend
//       try {
//         await GroupChatService.sendMessage(senderId!, widget.trackName, messageContent);
//         print('Message sent to backend'); // Debug log
//       } catch (e) {
//         print('Failed to send message to the backend: $e');
//       }
//
//       // Send the message through Socket.IO
//       socket.emit('message', json.encode(message));
//       print('Message sent through socket'); // Debug log
//     }
//   }
//
//   @override
//   void dispose() {
//     socket.disconnect();
//     socket.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.trackName, style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 final isUserMessage = message.isUser;
//                 return Align(
//                   alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//                     child: Column(
//                       crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                       children: [
//                         if (!isUserMessage)
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
//                             child: Text(
//                               '${message.firstName} ${message.lastName}',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         for (var msg in message.messages)
//                           Container(
//                             constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//                             child: Card(
//                               color: isUserMessage ? Colors.lightBlue[300] : Colors.grey[350],
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(msg),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: 'Type a message...',
//                       border: OutlineInputBorder(), // Default border
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color.fromRGBO(21, 101, 192, 1), // Set the desired border color
//                         ),
//                       ),
//                     ),
//                     onSubmitted: (text) => _sendMessage(),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   color: Color.fromRGBO(21, 101, 192, 1),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   final bool isUser;
//   final String? firstName;
//   final String? lastName;
//   final List<String> messages;
//   final String senderId;
//
//   ChatMessage({
//     required this.isUser,
//     this.firstName,
//     this.lastName,
//     required this.messages,
//     required this.senderId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//       children: [
//         if (!isUser) // Only show name for other users
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
//             child: Text(
//               '$firstName $lastName',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         for (var message in messages)
//           Align(
//             alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//             child: Container(
//               constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//               child: Card(
//                 color: isUser ? Colors.lightBlue[300] : Colors.grey[350],
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(message),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
//




import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';
import 'package:techmate/services/courses/group_chat_service.dart';

class WritingMessageScreen extends StatefulWidget {
  static const routeName = 'trackchat';
  final String trackName;

  WritingMessageScreen({required this.trackName});

  @override
  _WritingMessageScreenState createState() => _WritingMessageScreenState();
}

class _WritingMessageScreenState extends State<WritingMessageScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  late IO.Socket socket;
  String? senderId;

  @override
  void initState() {
    super.initState();
    _initializeSenderId().then((_) {
      _connectSocket();
      _fetchMessages();
    });
  }

  void _connectSocket() {
    socket = IO.io(
        'http://192.168.1.105:5000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());

    socket.connect();

    socket.onConnect((_) {
      print('connected');
    });

    socket.on('initialMessages', (data) {
      final parsedMessage = json.decode(data);
      if (parsedMessage['type'] == 'group' &&
          parsedMessage['track'] == widget.trackName) {
        if (!mounted) return; // Ensure widget is still mounted
        setState(() {
          if (_messages.isNotEmpty &&
              _messages.last.senderId ==
                  parsedMessage['sender_id'].toString()) {
            _messages.last.messages.add(parsedMessage['content']);
          } else {
            _messages.add(ChatMessage(
              isUser: parsedMessage['sender_id'].toString() == senderId,
              senderId: parsedMessage['sender_id'].toString(),
              messages: [parsedMessage['content']],
              firstName: parsedMessage['first_name'],
              lastName: parsedMessage['last_name'],
            ));
          }
        });
      }
    });

    socket.onConnectError((data) {
      print('Connection Error: $data');
    });

    socket.onError((data) {
      print('Error: $data');
    });
  }

  Future<void> _initializeSenderId() async {
    senderId = await _getSenderId();
    print('Sender ID initialized: $senderId'); // Debug log
  }

  Future<void> _fetchMessages() async {
    try {
      final messages = await GroupChatService.getMessages(widget.trackName);
      if (!mounted) return; // Ensure widget is still mounted
      setState(() {
        for (var messageGroup in messages) {
          _messages.add(ChatMessage(
            isUser: messageGroup['sender_id'].toString() == senderId,
            senderId: messageGroup['sender_id'].toString(),
            messages: List<String>.from(messageGroup['messages']),
            firstName: messageGroup['first_name'],
            lastName: messageGroup['last_name'],
          ));
        }
      });
    } catch (e) {
      print('Failed to fetch messages: $e');
    }
  }

  Future<String?> _getSenderId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.get('national_id');
    return id?.toString();
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty && senderId != null) {
      final messageContent = _controller.text;
      final message = {
        'type': 'group',
        'sender_id': senderId,
        'track': widget.trackName,
        'content': messageContent,
      };

      setState(() {
        if (_messages.isNotEmpty && _messages.last.isUser) {
          _messages.last.messages.add(messageContent);
        } else {
          _messages.add(ChatMessage(
            isUser: true,
            senderId: senderId!,
            messages: [messageContent],
            firstName: 'Me', // or fetch your own profile if needed
            lastName: '',
          ));
        }
        _controller.clear();
      });

      // Send the message to the backend
      try {
        await GroupChatService.sendMessage(
            senderId!, widget.trackName, messageContent);
        print('Message sent to backend'); // Debug log
      } catch (e) {
        print('Failed to send message to the backend: $e');
      }

      // Send the message through Socket.IO
      socket.emit('message', json.encode(message));
      print('Message sent through socket'); // Debug log
    }
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.trackName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message.isUser;
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: isUserMessage
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (!isUserMessage)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 4.0),
                            child: Text(
                              '${message.firstName} ${message.lastName}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        for (var msg in message.messages)
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                MediaQuery.of(context).size.width * 0.8),
                            child: Card(
                              color: isUserMessage
                                  ? Colors.blue[
                              800] // Message background color for user
                                  : Colors.grey[
                              350], // Message background color for others
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  msg,
                                  style: TextStyle(
                                    color: isUserMessage
                                        ? Colors
                                        .white // Text color for user messages
                                        : Colors
                                        .black, // Text color for other messages
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(), // Default border
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(
                              21, 101, 192, 1), // Set the desired border color
                        ),
                      ),
                    ),
                    onSubmitted: (text) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Color.fromRGBO(21, 101, 192, 1),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String? firstName;
  final String? lastName;
  final List<String> messages;
  final String senderId;

  ChatMessage({
    required this.isUser,
    this.firstName,
    this.lastName,
    required this.messages,
    required this.senderId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isUser) // Only show name for other users
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
            child: Text(
              '$firstName $lastName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        for (var message in messages)
          Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Card(
                color: isUser ? Colors.blue[800] : Colors.grey[350],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
