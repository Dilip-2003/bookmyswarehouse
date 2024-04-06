import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedAppBar extends StatelessWidget {
  const SavedAppBar({
    super.key,
    required this.icons,
    required this.emailText,
  });
  final String emailText;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    var savedAppSearchController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(81),
          ),
          height: height * 0.06,
          child: TextField(
            controller: savedAppSearchController,
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
    );
  }
}
