import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {super.key,
      required this.btnText,
      required this.colors,
      required this.borderColors});
  final String btnText;
  final Color colors, borderColors;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        print('login button pressed');
      },
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(81),
            border: Border.all(
              width: 1,
              color: borderColors,
            )),
        child: Row(
          children: [
            Container(
              width: width * 0.05,
              padding: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.apple,
                size: 24,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(
              width: width * 0.75,
              child: Center(
                child: Text(
                  btnText,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
