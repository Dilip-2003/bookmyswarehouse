import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar(
      {super.key,
      required this.icons,
      required this.emailText,
      required this.colors});
  final String emailText;
  final Icon icons;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var chatAppSearchController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(81),
            color: colors,
          ),
          height: height * 0.062,
          child: TextField(
            controller: chatAppSearchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: icons,
              ),
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
    );
  }
}
