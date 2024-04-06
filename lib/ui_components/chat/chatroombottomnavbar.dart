import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoomBottomNavBar extends StatelessWidget {
  const ChatRoomBottomNavBar({
    super.key,
    required this.icons,
    required this.emailText,
    required this.colors,
  });
  final String emailText;
  final Icon icons;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var chatAppController = TextEditingController();
    return Container(
      height: height * 0.075,
      width: width,
      color: BasicColor.deepWhite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              print('add circle button pressed');
            },
            icon: const Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(81),
              color: colors,
            ),
            height: height * 0.062,
            width: width * 0.75,
            child: TextField(
              controller: chatAppController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: icons,
                hintText: emailText,
                hintStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(81),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
