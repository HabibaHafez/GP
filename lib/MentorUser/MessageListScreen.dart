// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/MentorUser/ChatScreen.dart';
// import 'package:techmate/services/chats/MentorChatAPI.dart';
// import 'NavBar.dart'; // Assuming you have a BottomNavBar widget
//
// class MessageListScreen extends StatefulWidget {
//   final int mentorId; // Mentor ID
//
//   MessageListScreen({
//     required this.mentorId,
//   });
//
//   @override
//   _MessageListScreenState createState() => _MessageListScreenState();
// }
//
// class _MessageListScreenState extends State<MessageListScreen> {
//   final MentorMessageService _messageService = MentorMessageService();
//   late Future<List<Message>> _messageListFuture;
//   late String studentId; // Initialize studentId
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchIds();
//     _messageListFuture = _messageService.getMessagesToMentor(widget.mentorId);
//   }
//
//   Future<void> _fetchIds() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final int? userId = prefs.getInt('userId');
//     if (userId != null) {
//       studentId = userId.toString();
//       print('Fetched student ID: $studentId');
//     } else {
//       studentId = '';
//       print('User ID not found in shared preferences');
//     }
//     setState(() {}); // Trigger rebuild after fetching IDs
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Message List'),
//       ),
//       bottomNavigationBar: BottomNavBar(currentIndex: 1), // Add BottomNavBar
//       body: FutureBuilder<List<Message>>(
//         future: _messageListFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to fetch messages'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No messages available'));
//           } else {
//             // Filter messages to remove duplicates and show only the most recent message
//             final uniqueMessages = _getUniqueMessages(snapshot.data!);
//             return ListView.builder(
//               itemCount: uniqueMessages.length,
//               itemBuilder: (context, index) {
//                 final message = uniqueMessages[index];
//                 return Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   child: ListTile(
//                     onTap: () {
//                       _navigateToChatScreen(message);
//                     },
//                     title: Text(
//                       '${message.firstName} ${message.lastName}',
//                       style: TextStyle(color: Colors.blue), // Change title color to blue
//                     ),
//                     subtitle: Text(
//                       message.messages.last, // Show the most recent message
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   List<Message> _getUniqueMessages(List<Message> messages) {
//     final Map<int, Message> uniqueMessageMap = {};
//     for (var message in messages) {
//       uniqueMessageMap[message.senderId] = message; // Replace with the most recent message
//     }
//     return uniqueMessageMap.values.toList();
//   }
//
//   void _navigateToChatScreen(Message message) {
//     print('Navigating to chat screen with student ID: $studentId');
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(
//           mentorId: widget.mentorId,
//           studentId: studentId, // Pass fetched student ID
//           message: message, // Pass the entire message object
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/MentorUser/ChatScreen.dart';
// import 'package:techmate/services/chats/MentorChatAPI.dart';
// import 'NavBar.dart'; // Assuming you have a BottomNavBar widget
//
// class MessageListScreen extends StatefulWidget {
//   final int mentorId; // Mentor ID
//
//   MessageListScreen({
//     required this.mentorId,
//   });
//
//   @override
//   _MessageListScreenState createState() => _MessageListScreenState();
// }
//
// class _MessageListScreenState extends State<MessageListScreen> {
//   final MentorMessageService _messageService = MentorMessageService();
//   late Future<List<Message>> _messageListFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _messageListFuture = _messageService.getMessagesToMentor(widget.mentorId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Message List'),
//       ),
//       bottomNavigationBar: BottomNavBar(currentIndex: 1), // Add BottomNavBar
//       body: FutureBuilder<List<Message>>(
//         future: _messageListFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to fetch messages'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No messages available'));
//           } else {
//             // Filter messages to remove duplicates and show only the most recent message
//             final uniqueMessages = _getUniqueMessages(snapshot.data!);
//             return ListView.builder(
//               itemCount: uniqueMessages.length,
//               itemBuilder: (context, index) {
//                 final message = uniqueMessages[index];
//                 return Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   child: ListTile(
//                     onTap: () {
//                       _navigateToChatScreen(message);
//                     },
//                     title: Text(
//                       '${message.firstName} ${message.lastName}',
//                       style: TextStyle(color: Colors.blue), // Change title color to blue
//                     ),
//                     subtitle: Text(
//                       message.messages.last, // Show the most recent message
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   List<Message> _getUniqueMessages(List<Message> messages) {
//     final Map<int, Message> uniqueMessageMap = {};
//     for (var message in messages) {
//       uniqueMessageMap[message.senderId] = message; // Replace with the most recent message
//     }
//     return uniqueMessageMap.values.toList();
//   }
//
//   void _navigateToChatScreen(Message message) {
//     print('Navigating to chat screen with student ID: ${message.senderId}');
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(
//           mentorId: widget.mentorId,
//           studentId: message.senderId.toString(), // Pass the sender ID from the message
//           message: message, // Pass the entire message object
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/MentorUser/ChatScreen.dart';
// import 'package:techmate/services/chats/MentorChatAPI.dart';
// import 'NavBar.dart'; // Assuming you have a BottomNavBar widget
//
// class MessageListScreen extends StatefulWidget {
//   final int mentorId; // Mentor ID
//
//   MessageListScreen({
//     required this.mentorId,
//   });
//
//   @override
//   _MessageListScreenState createState() => _MessageListScreenState();
// }
//
// class _MessageListScreenState extends State<MessageListScreen> {
//   final MentorMessageService _messageService = MentorMessageService();
//   late Future<List<Message>> _messageListFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _messageListFuture = _messageService.getMessagesToMentor(widget.mentorId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Message List'),
//       ),
//       bottomNavigationBar: BottomNavBar(currentIndex: 1), // Add BottomNavBar
//       body: FutureBuilder<List<Message>>(
//         future: _messageListFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to fetch messages'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No messages available'));
//           } else {
//             // Filter messages to remove duplicates and show only the most recent message
//             final uniqueMessages = _getUniqueMessages(snapshot.data!);
//             return ListView.builder(
//               itemCount: uniqueMessages.length,
//               itemBuilder: (context, index) {
//                 final message = uniqueMessages[index];
//                 final lastMessage = message.messages.isNotEmpty ? message.messages.last : '';
//                 return Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   child: ListTile(
//                     onTap: () {
//                       _navigateToChatScreen(message);
//                     },
//                     title: Text(
//                       '${message.firstName} ${message.lastName}',
//                       style: TextStyle(color: Colors.blue), // Change title color to blue
//                     ),
//                     subtitle: Text(
//                       lastMessage, // Show the most recent message
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   List<Message> _getUniqueMessages(List<Message> messages) {
//     final Map<int, Message> uniqueMessageMap = {};
//     for (var message in messages) {
//       uniqueMessageMap[message.senderId] = message; // Replace with the most recent message
//     }
//     return uniqueMessageMap.values.toList();
//   }
//
//   void _navigateToChatScreen(Message message) {
//     print('Navigating to chat screen with student ID: ${message.senderId}');
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(
//           mentorId: widget.mentorId,
//           studentId: message.senderId.toString(), // Pass the sender ID from the message
//           message: ChatScreenMessage( // Convert Message to ChatScreenMessage
//             senderId: message.senderId,
//             receiverId: widget.mentorId,
//             content: message.messages.join('\n'), // Joining all messages from this sender
//             firstName: message.firstName,
//             lastName: message.lastName,
//             timestamp: DateTime.now(), // Use current timestamp or adjust as needed
//           ),
//         ),
//       ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/MentorUser/ChatScreen.dart';
import 'package:techmate/services/chats/MentorChatAPI.dart';
import 'NavBar.dart'; // Assuming you have a BottomNavBar widget

class MessageListScreen extends StatefulWidget {
  final int mentorId; // Mentor ID

  MessageListScreen({
    required this.mentorId,
  });

  @override
  _MessageListScreenState  createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final MentorMessageService _messageService = MentorMessageService();
  late Future<List<Message>> _messageListFuture;

  @override
  void initState() {
    super.initState();
    _messageListFuture = _messageService.getMessagesToMentor(widget.mentorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Messages',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1), // Add BottomNavBar
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: FutureBuilder<List<Message>>(
          future: _messageListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to fetch messages'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No messages available'));
            } else {
              // Filter messages to remove duplicates and show only the most recent message
              final uniqueMessages = _getUniqueMessages(snapshot.data!);
              return ListView.builder(
                itemCount: uniqueMessages.length,
                itemBuilder: (context, index) {
                  final message = uniqueMessages[index];
                  final lastMessage =
                  message.messages.isNotEmpty ? message.messages.last : '';
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue[800]!, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        _navigateToChatScreen(message);
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[800],
                        child: Text(
                          message.firstName[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      title: Text(
                        '${message.firstName} ${message.lastName}',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 20), // Change title color to blue
                      ),
                      subtitle: Text(
                        lastMessage,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors
                                .grey[600]), // Show the most recent message
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  List<Message> _getUniqueMessages(List<Message> messages) {
    final Map<int, Message> uniqueMessageMap = {};
    for (var message in messages) {
      uniqueMessageMap[message.senderId] =
          message; // Replace with the most recent message
    }
    return uniqueMessageMap.values.toList();
  }

  void _navigateToChatScreen(Message message) {
    print('Navigating to chat screen with student ID: ${message.senderId}');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChatScreen(
          mentorId: widget.mentorId,
          studentId: message.senderId
              .toString(), // Pass the sender ID from the message
          message: ChatScreenMessage(
            // Convert Message to ChatScreenMessage
            senderId: message.senderId,
            receiverId: widget.mentorId,
            content: message.messages
                .join('\n'), // Joining all messages from this sender
            firstName: message.firstName,
            lastName: message.lastName,
            timestamp:
            DateTime.now(), // Use current timestamp or adjust as needed
          ),
        ),
      ),
    );
  }
}
