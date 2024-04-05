import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/chat/chatroom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E7),
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
        title: const ChatRoomAppBar(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RightChat(),
            LeftChat(),
            RightChat(),
            LeftChat(),
            RightChat(),
            LeftChat(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class RightChat extends StatelessWidget {
  const RightChat({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 14,
                    color: BasicColor.primary,
                  ),
                  Text('${currentHour.toString()}:${currentMinute.toString()}'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(right: 10, top: 10, left: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: BasicColor.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: 250,
                child: const Text(
                  'Your long text goes here...Your long text goes here...Your long text goes here...Your long text goes here...Your long text goes here...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LeftChat extends StatelessWidget {
  const LeftChat({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: BasicColor.deepWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                width: 250,
                child: const Text(
                  'Your long text goes here...Your long text goes here...Your long text goes here...Your long text goes here...Your long text goes here...',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${currentHour.toString()}:${currentMinute.toString()}'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
