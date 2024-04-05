import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/chat/chatroom_appbar.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
            color: BasicColor.deepBlack,
          ),
        ),
        title: ChatRoomAppBar(),
      ),
    );
  }
}
