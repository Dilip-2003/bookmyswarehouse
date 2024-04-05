import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/chat/chatappbar.dart';
import 'package:bookmywarehouse/ui_components/chat/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ChatAppBar(
          icons: Icon(
            Icons.search,
            size: 30,
          ),
          emailText: 'Search messages',
          colors: Color(0xFFF2F2F3),
        ),
      ),
      body: const ChatScreenBody(),
    );
  }
}

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('dd/MM/yyyy').format(now);
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoom(),
                ));
            print('switching chatscreen to chat room');
          },
          child: Container(
            height: height * 0.08,
            width: width * 0.9,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.015,
              vertical: width * 0.015,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/owner_img.png'),
                  radius: 25,
                ),
                Container(
                  width: width * 0.82,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dilip Sarkar',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.13,
                                  color: BasicColor.deepBlack,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Text(formattedTime)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'Sarkar Sarkar Sarkar Sarkar Sarkar Sarkar Sarkar Sarkar Sarkar SarkarSarkar Sarkar Sarkar Sarkar Sarkar',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.1),
                            child: const Icon(
                              Icons.check,
                              size: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
