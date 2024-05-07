import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/chat/widgets/chatroom_appbar.dart';
import 'package:bookmywarehouse/src/chat/widgets/chatroombottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
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
        title: ChatRoomAppBar(
          name: name,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const RightChat(),
                const LeftChat(),
                const RightChat(),
                const LeftChat(),
                const RightChat(),
                const LeftChat(),
                SizedBox(
                  height: height * 0.08,
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            child: ChatRoomBottomNavBar(
              icons: Icon(
                Icons.search,
                size: 30,
              ),
              emailText: 'Search messages',
              colors: Color(0xFFF2F2F3),
            ),
          ),
        ],
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
