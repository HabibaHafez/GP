import 'dart:convert';
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
    socket.on('userMentorMessage', (data) {
      Provider.of<MessageProvider>(context, listen: false)
          .receiveMessage(Message.fromJson(json.decode(data)));
    });

    // Fetch messages for the current mentor
    print(
        'MentorChatScreen initState - currentUserId: ${widget.currentUserId}, mentorId: ${widget.mentorId}');
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
      socket.emit('userMentorMessage', json.encode(newMessage.toJson()));

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
        title: Text('Chat with Mentor', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          // Messages list view
          Expanded(
            child: Consumer<MessageProvider>(
              builder: (context, messageProvider, _) {
                List<Message> messages =
                messageProvider.getMessagesForMentor(widget.mentorId);

                List<List<Message>> groupedMessages = [];
                List<Message> currentGroup = [];

                for (Message message in messages) {
                  if (currentGroup.isEmpty ||
                      currentGroup.last.senderId == message.senderId) {
                    currentGroup.add(message);
                  } else {
                    groupedMessages.add(currentGroup);
                    currentGroup = [message];
                  }
                }
                if (currentGroup.isNotEmpty) {
                  groupedMessages.add(currentGroup);
                }

                return ListView.builder(
                  reverse:
                  false, // Set to false to show messages in the right order
                  itemCount: groupedMessages.length,
                  itemBuilder: (context, index) {
                    List<Message> group = groupedMessages[index];
                    bool isMe =
                        group.first.senderId.toString() == widget.currentUserId;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${isMe ? 'You' : 'Mentor'} • ${group.first.timestamp}',
                            style: TextStyle(
                              fontSize: 12.0, // Slightly decreased font size
                              color: Colors.black, // Set font color to black
                            ),
                          ),
                          ...group
                              .map((message) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? Colors.blue[800]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            constraints: BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width *
                                  0.8, // 80% of screen width
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(
                                fontSize:
                                14.0, // Slightly decreased font size
                                color: isMe
                                    ? Colors.white // Set font color to white for blue cards
                                    : Colors.black, // Set font color to black for green cards
                              ),
                            ),
                          ))
                              .toList(),
                        ],
                      ),
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
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, // Set the desired border color
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
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
