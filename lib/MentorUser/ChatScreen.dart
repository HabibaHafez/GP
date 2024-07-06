import 'package:flutter/material.dart';
import 'package:techmate/services/chats/MentorChatAPI.dart';
import 'package:techmate/MentorUser/NavBar.dart';
class ChatScreen extends StatefulWidget {
  final int mentorId; // Mentor ID
  final String studentId; // Student ID
  final int senderId; // Sender ID

  ChatScreen({
    required this.mentorId,
    required this.studentId,
    required this.senderId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  late MentorMessageService _messageService;

  @override
  void initState() {
    super.initState();
    _messageService = MentorMessageService();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      List<Message> messages =
      await _messageService.getMessagesToMentor(widget.mentorId);

      setState(() {
        _messages.addAll(messages.map((msg) => ChatMessage(
          isUser: true,
          message: msg.messages.join('\n'),
        )));
      });
    } catch (e) {
      print('Failed to load messages: $e');
    }
  }

  void _sendMessage(String messageContent) async {
    if (messageContent.isNotEmpty) {
      try {
        await _messageService.sendMessage(
          senderId: widget.senderId,
          receiverId: widget.mentorId,
          content: messageContent,
        );

        setState(() {
          _messages.add(ChatMessage(
            isUser: true,
            message: messageContent,
          ));
          _controller.clear();
        });
      } catch (e) {
        print('Failed to send message: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Mentor'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          currentIndex:1,
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
