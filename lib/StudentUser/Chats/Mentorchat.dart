
import 'package:flutter/material.dart';

class MentorChatScreen extends StatefulWidget {
  static const routeName = 'mentorchat';

  @override
  _MentorChatScreenState createState ()=> _MentorChatScreenState();
}

class _MentorChatScreenState extends State<MentorChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(
        isUser: false,
        text: "Hi there! I'm your mentor. How can I assist you today?"),
    ChatMessage(isUser: true, text: 'Hello! I need help with my project.'),
    ChatMessage(isUser: false, text: 'Sure, what specifically do you need help with?'),
    ChatMessage(
        isUser: true, text: 'I am struggling with the data analysis part.'),
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(isUser: true, text: _controller.text));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with Mentor',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white), // Set the icon color to white
              onSelected: (value) {
                // Handle menu item selection (e.g., delete chat, clear chat, block)
                if (value == 'delete') {
                  // Delete chat logic
                } else if (value == 'clear') {
                  // Clear chat logic
                } else if (value == 'block') {
                  // Block user logic
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.black), // Set the icon color
                      SizedBox(width: 10),
                      Text('Delete Chat'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'clear',
                  child: Row(
                    children: [
                      Icon(Icons.clear, color: Colors.black), // Set the icon color
                      SizedBox(width: 10),
                      Text('Clear Chat'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'block',
                  child: Row(
                    children: [
                      Icon(Icons.block, color: Colors.black), // Set the icon color
                      SizedBox(width: 10),
                      Text('Block User'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
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
                          color: Color.fromRGBO(21, 101, 192, 1), // Set the desired border color
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
  final String text;

  ChatMessage({required this.isUser, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isUser ? Colors.blue[200] : Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}
