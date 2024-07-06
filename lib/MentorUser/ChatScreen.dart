// // import 'package:flutter/material.dart';
// // import 'package:techmate/services/chats/MentorChatAPI.dart';
// // import 'package:techmate/MentorUser/NavBar.dart';
// //
// // class ChatScreen extends StatefulWidget {
// //   final int mentorId; // Mentor ID
// //   final String studentId; // Student ID (string)
// //   final Message message; // Message object
// //
// //   ChatScreen({
// //     required this.mentorId,
// //     required this.studentId,
// //     required this.message,
// //   });
// //
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }
// //
// // class _ChatScreenState extends State<ChatScreen> {
// //   final List<ChatMessage> _messages = [];
// //   final TextEditingController _controller = TextEditingController();
// //   late MentorMessageService _messageService;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _messageService = MentorMessageService();
// //     _initializeMessages();
// //   }
// //
// //   void _initializeMessages() {
// //     setState(() {
// //       _messages.addAll(widget.message.messages.map((msg) => ChatMessage(
// //         isUser: widget.message.senderId == int.tryParse(widget.studentId), // Cast studentId to int safely
// //         message: msg,
// //       )));
// //     });
// //   }
// //
// //   void _sendMessage(String messageContent) async {
// //     if (messageContent.isNotEmpty) {
// //       try {
// //         print('Student ID before parsing: ${widget.studentId}');
// //         int? studentIdInt = int.tryParse(widget.studentId);
// //         if (studentIdInt == null) {
// //           print('Invalid student ID: ${widget.studentId}');
// //           return;
// //         }
// //
// //         print('Sending message with details:');
// //         print('Sender ID: $studentIdInt');
// //         print('Receiver ID: ${widget.message.senderId}');
// //         print('Content: $messageContent');
// //
// //         await _messageService.sendMessage(
// //           senderId: studentIdInt, // Use the parsed int value
// //           receiverId: widget.message.senderId,
// //           content: messageContent,
// //         );
// //
// //         setState(() {
// //           _messages.add(ChatMessage(
// //             isUser: true,
// //             message: messageContent,
// //           ));
// //           _controller.clear();
// //         });
// //       } catch (e) {
// //         print('Failed to send message: $e');
// //       }
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Chat with ${widget.message.firstName} ${widget.message.lastName}'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: _messages.length,
// //               itemBuilder: (context, index) {
// //                 final message = _messages[index];
// //                 return Align(
// //                   alignment: message.isUser
// //                       ? Alignment.centerRight
// //                       : Alignment.centerLeft,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 4.0, horizontal: 8.0),
// //                     child: Container(
// //                       constraints: BoxConstraints(
// //                           maxWidth: MediaQuery.of(context).size.width * 0.8),
// //                       child: Card(
// //                         color: message.isUser
// //                             ? Colors.lightBlue[300]
// //                             : Colors.grey[350],
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(message.message),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: InputDecoration(
// //                       hintText: 'Type a message...',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                     onSubmitted: (text) => _sendMessage(text),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send),
// //                   onPressed: () => _sendMessage(_controller.text),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavBar(
// //         currentIndex: 1,
// //       ),
// //     );
// //   }
// // }
// //
// // class ChatMessage {
// //   final bool isUser;
// //   final String message;
// //
// //   ChatMessage({
// //     required this.isUser,
// //     required this.message,
// //   });
// // }
// //
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:techmate/services/chats/MentorChatAPI.dart';
// // import 'package:techmate/MentorUser/NavBar.dart';
// //
// // class ChatScreen extends StatefulWidget {
// //   final int mentorId; // Mentor ID
// //   final String studentId; // Student ID (string)
// //   final Message message; // Message object
// //
// //   ChatScreen({
// //     required this.mentorId,
// //     required this.studentId,
// //     required this.message,
// //   });
// //
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }
// //
// // class _ChatScreenState extends State<ChatScreen> {
// //   final List<ChatMessage> _messages = [];
// //   final TextEditingController _controller = TextEditingController();
// //   late MentorMessageService _messageService;
// //   int? _currentUserId;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _messageService = MentorMessageService();
// //     _fetchCurrentUserId();
// //     _initializeMessages();
// //   }
// //
// //   Future<void> _fetchCurrentUserId() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     final int? userId = prefs.getInt('national_id');
// //     if (userId != null) {
// //       setState(() {
// //         _currentUserId = userId;
// //       });
// //     }
// //   }
// //
// //   void _initializeMessages() {
// //     setState(() {
// //       _messages.addAll(widget.message.messages.map((msg) => ChatMessage(
// //         isUser: widget.message.senderId == widget.mentorId,
// //         message: msg,
// //       )));
// //     });
// //   }
// //
// //   void _sendMessage(String messageContent) async {
// //     if (messageContent.isNotEmpty && _currentUserId != null) {
// //       try {
// //         int receiverId = int.parse(widget.studentId);
// //
// //         print('Sending message with details:');
// //         print('Sender ID: $_currentUserId');
// //         print('Receiver ID: $receiverId');
// //         print('Content: $messageContent');
// //
// //         await _messageService.sendMessage(
// //           senderId: _currentUserId!, // Use the fetched user ID
// //           receiverId: receiverId,
// //           content: messageContent,
// //         );
// //
// //         setState(() {
// //           _messages.add(ChatMessage(
// //             isUser: true,
// //             message: messageContent,
// //           ));
// //           _controller.clear();
// //         });
// //       } catch (e) {
// //         print('Failed to send message: $e');
// //       }
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Chat with ${widget.message.firstName} ${widget.message.lastName}'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: _messages.length,
// //               itemBuilder: (context, index) {
// //                 final message = _messages[index];
// //                 return Align(
// //                   alignment: message.isUser
// //                       ? Alignment.centerRight
// //                       : Alignment.centerLeft,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 4.0, horizontal: 8.0),
// //                     child: Container(
// //                       constraints: BoxConstraints(
// //                           maxWidth: MediaQuery.of(context).size.width * 0.8),
// //                       child: Card(
// //                         color: message.isUser
// //                             ? Colors.lightBlue[300]
// //                             : Colors.grey[350],
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Text(message.message),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: InputDecoration(
// //                       hintText: 'Type a message...',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                     onSubmitted: (text) => _sendMessage(text),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send),
// //                   onPressed: () => _sendMessage(_controller.text),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavBar(
// //         currentIndex: 1,
// //       ),
// //     );
// //   }
// // }
// //
// // class ChatMessage {
// //   final bool isUser;
// //   final String message;
// //
// //   ChatMessage({
// //     required this.isUser,
// //     required this.message,
// //   });
// // }
//
//
// //Let's try after the imrpovements
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/services/chats/MentorChatAPI.dart';
// import 'package:techmate/MentorUser/NavBar.dart';
//
// class ChatScreen extends StatefulWidget {
//   final int mentorId; // Mentor ID
//   final String studentId; // Student ID (string)
//   final Message message; // Message object
//
//   ChatScreen({
//     required this.mentorId,
//     required this.studentId,
//     required this.message,
//   });
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _controller = TextEditingController();
//   late MentorMessageService _messageService;
//   int? _currentUserId;
//
//   @override
//   void initState() {
//     super.initState();
//     _messageService = MentorMessageService();
//     _fetchCurrentUserId();
//   }
//
//   Future<void> _fetchCurrentUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final int? userId = prefs.getInt('national_id');
//     if (userId != null) {
//       setState(() {
//         _currentUserId = userId;
//         _initializeMessages();
//       });
//     }
//   }
//
//   void _initializeMessages() async {
//     try {
//       List<Message> messages = await _messageService.getConversation(
//         senderId: widget.mentorId,
//         receiverId: int.parse(widget.studentId),
//       );
//
//       setState(() {
//         _messages.clear();
//         _messages.addAll(messages.map((msg) => ChatMessage(
//           isUser: msg.senderId == _currentUserId,
//           message: msg.messages.join("\n"), // Joining all messages from this sender
//         )));
//       });
//     } catch (e) {
//       print('Failed to fetch messages: $e');
//     }
//   }
//
//   void _sendMessage(String messageContent) async {
//     if (messageContent.isNotEmpty && _currentUserId != null) {
//       try {
//         int receiverId = int.parse(widget.studentId);
//
//         print('Sending message with details:');
//         print('Sender ID: $_currentUserId');
//         print('Receiver ID: $receiverId');
//         print('Content: $messageContent');
//
//         await _messageService.sendMessage(
//           senderId: _currentUserId!, // Use the fetched user ID
//           receiverId: receiverId,
//           content: messageContent,
//         );
//
//         setState(() {
//           _messages.add(ChatMessage(
//             isUser: true,
//             message: messageContent,
//           ));
//           _controller.clear();
//         });
//
//         // Refresh the message list after sending a message
//         _initializeMessages();
//       } catch (e) {
//         print('Failed to send message: $e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.message.firstName} ${widget.message.lastName}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Align(
//                   alignment: message.isUser
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 4.0, horizontal: 8.0),
//                     child: Container(
//                       constraints: BoxConstraints(
//                           maxWidth: MediaQuery.of(context).size.width * 0.8),
//                       child: Card(
//                         color: message.isUser
//                             ? Colors.lightBlue[300]
//                             : Colors.grey[350],
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(message.message),
//                         ),
//                       ),
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
//                       border: OutlineInputBorder(),
//                     ),
//                     onSubmitted: (text) => _sendMessage(text),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () => _sendMessage(_controller.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 1,
//       ),
//     );
//   }
// }
//
// class ChatMessage {
//   final bool isUser;
//   final String message;
//
//   ChatMessage({
//     required this.isUser,
//     required this.message,
//   });
// }

//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/services/chats/MentorChatAPI.dart';
// import 'package:techmate/MentorUser/NavBar.dart';
//
// class ChatScreen extends StatefulWidget {
//   final int mentorId; // Mentor ID
//   final String studentId; // Student ID (string)
//   final Message message; // Message object
//
//   ChatScreen({
//     required this.mentorId,
//     required this.studentId,
//     required this.message,
//   });
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _controller = TextEditingController();
//   late MentorMessageService _messageService;
//   int? _currentUserId;
//
//   @override
//   void initState() {
//     super.initState();
//     _messageService = MentorMessageService();
//     _fetchCurrentUserId();
//   }
//
//   Future<void> _fetchCurrentUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final int? userId = prefs.getInt('national_id');
//     if (userId != null) {
//       setState(() {
//         _currentUserId = userId;
//         _initializeMessages();
//       });
//     }
//   }
//
//   void _initializeMessages() async {
//     try {
//       List<Message> messages = await _messageService.getConversation(
//         senderId: widget.mentorId,
//         receiverId: int.parse(widget.studentId),
//       );
//
//       setState(() {
//         _messages.clear();
//         _messages.addAll(messages.map((msg) => ChatMessage(
//           isUser: msg.senderId == _currentUserId,
//           message: msg.content,
//         )));
//       });
//     } catch (e) {
//       print('Failed to fetch messages: $e');
//     }
//   }
//
//   void _sendMessage(String messageContent) async {
//     if (messageContent.isNotEmpty && _currentUserId != null) {
//       try {
//         int receiverId = int.parse(widget.studentId);
//
//         print('Sending message with details:');
//         print('Sender ID: $_currentUserId');
//         print('Receiver ID: $receiverId');
//         print('Content: $messageContent');
//
//         await _messageService.sendMessage(
//           senderId: _currentUserId!, // Use the fetched user ID
//           receiverId: receiverId,
//           content: messageContent,
//         );
//
//         setState(() {
//           _messages.add(ChatMessage(
//             isUser: true,
//             message: messageContent,
//           ));
//           _controller.clear();
//         });
//
//         // Refresh the message list after sending a message
//         _initializeMessages();
//       } catch (e) {
//         print('Failed to send message: $e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.message.firstName} ${widget.message.lastName}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Align(
//                   alignment: message.isUser
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 4.0, horizontal: 8.0),
//                     child: Container(
//                       constraints: BoxConstraints(
//                           maxWidth: MediaQuery.of(context).size.width * 0.8),
//                       child: Card(
//                         color: message.isUser
//                             ? Colors.lightBlue[300]
//                             : Colors.grey[350],
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(message.message),
//                         ),
//                       ),
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
//                       border: OutlineInputBorder(),
//                     ),
//                     onSubmitted: (text) => _sendMessage(text),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () => _sendMessage(_controller.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 1,
//       ),
//     );
//   }
// }
//
// class ChatMessage {
//   final bool isUser;
//   final String message;
//
//   ChatMessage({
//     required this.isUser,
//     required this.message,
//   });
// }



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/chats/MentorChatAPI.dart';
import 'package:techmate/MentorUser/NavBar.dart';

class ChatScreen extends StatefulWidget {
  final int mentorId; // Mentor ID
  final String studentId; // Student ID (string)
  final ChatScreenMessage message; // ChatScreenMessage object

  ChatScreen({
    required this.mentorId,
    required this.studentId,
    required this.message,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late MentorMessageService _messageService;
  int? _currentUserId;

  @override
  void initState() {
    super.initState();
    _messageService = MentorMessageService();
    _fetchCurrentUserId();
  }

  Future<void> _fetchCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('national_id');
    if (userId != null) {
      setState(() {
        _currentUserId = userId;
        _initializeMessages();
      });
    }
  }

  void _initializeMessages() async {
    try {
      List<ChatScreenMessage> messages = await _messageService.getConversation(
        senderId: widget.mentorId,
        receiverId: int.parse(widget.studentId),
      );

      setState(() {
        _messages.clear();
        _messages.addAll(messages.map((msg) => ChatMessage(
          isUser: msg.senderId == _currentUserId,
          message: msg.content,
        )));
        _scrollToBottom();
      });
    } catch (e) {
      print('Failed to fetch messages: $e');
    }
  }

  void _sendMessage(String messageContent) async {
    if (messageContent.isNotEmpty && _currentUserId != null) {
      try {
        int receiverId = int.parse(widget.studentId);

        await _messageService.sendMessage(
          senderId: _currentUserId!,
          receiverId: receiverId,
          content: messageContent,
        );

        setState(() {
          _messages.add(ChatMessage(
            isUser: true,
            message: messageContent,
          ));
          _controller.clear();
          _scrollToBottom();
        });

        // Avoid refetching all messages to prevent duplication
      } catch (e) {
        print('Failed to send message: $e');
      }
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.message.firstName} ${widget.message.lastName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      child: Card(
                        color: message.isUser
                            ? Colors.lightBlue[300]
                            : Colors.grey[350],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(message.message),
                        ),
                      ),
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
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (text) => _sendMessage(text),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}

class ChatMessage {
  final bool isUser;
  final String message;

  ChatMessage({
    required this.isUser,
    required this.message,
  });
}

