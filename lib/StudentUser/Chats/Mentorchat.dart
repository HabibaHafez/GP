import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:techmate/providers/message_provider.dart';
import 'package:techmate/services/chats/message.dart';

class MentorChatScreen extends StatefulWidget {
  static const routeName = 'mentor_chat';

  final String currentUserId;
  final String mentorId;

  MentorChatScreen({
    required this.currentUserId,
    required this.mentorId,
  });

  @override
  _MentorChatScreenState createState() => _MentorChatScreenState();
}

class _MentorChatScreenState extends State<MentorChatScreen> {
  late TextEditingController _messageController;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();

    // Initialize Socket.io connection
    socket = IO.io('http://192.168.1.105:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // Listen for incoming messages
    socket.on('message', (data) {
      Provider.of<MessageProvider>(context, listen: false).receiveMessage(data);
    });

    // Fetch messages for the current mentor
    Provider.of<MessageProvider>(context, listen: false)
        .fetchMessages(widget.currentUserId, widget.mentorId);
  }

  @override
  void dispose() {
    _messageController.dispose();
    socket.disconnect();
    super.dispose();
  }

  void _sendMessage(String content) {
    if (content.isNotEmpty) {
      // Create a new message object
      Message newMessage = Message(
        senderId: int.parse(widget.currentUserId),
        receiverId: int.parse(widget.mentorId),
        content: content,
        timestamp: DateTime.now(),
      );

      // Emit the message to the server
      socket.emit('message', newMessage.toJson());

      // Clear the message input field
      _messageController.clear();

      // Add the message locally for immediate UI update
      Provider.of<MessageProvider>(context, listen: false)
          .sendMessage(newMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Mentor'),
      ),
      body: Column(
        children: <Widget>[
          // Messages list view
          Expanded(
            child: Consumer<MessageProvider>(
              builder: (context, messageProvider, _) {
                List<Message> messages =
                messageProvider.getMessagesForMentor(widget.mentorId);
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];
                    // Determine if the message is sent by current user
                    bool isMe =
                        message.senderId.toString() == widget.currentUserId;
                    return ListTile(
                      title: Text(message.content),
                      subtitle: Text(
                        '${isMe ? 'You' : 'Mentor'} • ${message.timestamp}',
                      ),
                      trailing: isMe ? null : Icon(Icons.account_circle),
                      leading: isMe ? Icon(Icons.account_circle) : null,
                    );
                  },
                );
              },
            ),
          ),
          // Message input field and send button
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
