import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart'; // Import for formatting timestamps

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'user-id');
  final _otherUser = const types.User(id: 'other-user-id');
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addDummyMessages();
  }

  void _addDummyMessages() {
    final dummyMessages = [
      types.TextMessage(
        author: _otherUser,
        createdAt: DateTime.now()
            .subtract(const Duration(minutes: 5))
            .millisecondsSinceEpoch,
        id: 'random-id-0',
        text: 'Hello! How can I help you today?',
      ),
      types.TextMessage(
        author: _user,
        createdAt: DateTime.now()
            .subtract(const Duration(minutes: 4))
            .millisecondsSinceEpoch,
        id: 'random-id-1',
        text: 'I have a question about your services.',
      ),
      types.TextMessage(
        author: _otherUser,
        createdAt: DateTime.now()
            .subtract(const Duration(minutes: 3))
            .millisecondsSinceEpoch,
        id: 'random-id-2',
        text: 'Sure, go ahead!',
      ),
    ];

    setState(() {
      _messages.insertAll(0, dummyMessages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_sharp,
                size: 30,
              )),
          backgroundColor: BasicColor.lightWhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID: 12345',
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: Chat(
              messages: _messages,
              onSendPressed: _handleSendPressed,
              user: _user,
              showUserAvatars: true, // Optional: Show user avatars
              showUserNames: true, // Optional: Show user names
              customBottomWidget: _buildCustomInput(), // Use custom input
              customMessageBuilder:
                  _customMessageBuilder, // Custom message builder
            ),
          ),
        ],
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'random-id-${_messages.length}',
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
      // Add a dummy reply from the other user after a delay
      Future.delayed(const Duration(seconds: 1), () {
        final replyMessage = types.TextMessage(
          author: _otherUser,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: 'random-id-${_messages.length + 1}',
          text: 'This is an automated reply to your message.',
        );

        setState(() {
          _messages.insert(0, replyMessage);
        });
      });
    });

    _controller.clear();
  }

  Widget _buildCustomInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _handleSendPressed(types.PartialText(text: _controller.text));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _customMessageBuilder(types.Message message,
      {required int messageWidth}) {
    if (message is types.TextMessage) {
      return Column(
        crossAxisAlignment: message.author.id == _user.id
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: message.author.id == _user.id
                  ? BasicColor.lightWhite
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              message.text,
              style: TextStyle(
                  color: message.author.id == _user.id
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: Text(
          //     DateFormat('hh:mm a').format(
          //         DateTime.fromMillisecondsSinceEpoch(message.createdAt!)),
          //     style: TextStyle(color: Colors.grey, fontSize: 12.0),
          //   ),
          // ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
