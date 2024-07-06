import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/MentorUser/ChatScreen.dart';
import 'package:techmate/services/chats/MentorChatAPI.dart';

class MessageListScreen extends StatefulWidget {
  final int mentorId; // Mentor ID

  MessageListScreen({
    required this.mentorId,
  });

  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final MentorMessageService _messageService = MentorMessageService();
  late Future<List<Message>> _messageListFuture;
  late String studentId = ''; // Initialize studentId

  @override
  void initState() {
    super.initState();
    _fetchIds();
    _messageListFuture = _messageService.getMessagesToMentor(widget.mentorId);
  }

  Future<void> _fetchIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    studentId =
        prefs.getInt('userId').toString(); // Fetch student ID dynamically
    setState(() {}); // Trigger rebuild after fetching IDs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message List'),
      ),
      body: FutureBuilder<List<Message>>(
        future: _messageListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to fetch messages'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No messages available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final message = snapshot.data![index];
                return ListTile(
                  onTap: () {
                    _navigateToChatScreen(message.senderId);
                  },
                  title: Text(
                    '${message.firstName} ${message.lastName}',
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: message.messages.map((msg) => Text(msg)).toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _navigateToChatScreen(int senderId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChatScreen(
          mentorId: widget.mentorId,
          studentId: studentId, // Pass fetched student ID
          senderId: senderId, // Pass sender ID from message list
        ),
      ),
    );
  }
}
