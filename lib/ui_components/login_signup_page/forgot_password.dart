import 'package:bookmywarehouse/ui_components/fotgot_password/recover_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: width * 0.25),
      child: InkWell(
        onTap: () {
          print('forgot password button pressed ');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecoverOptions(),
              ));
        },
        child: Center(
          child: Text(
            'Forgot password?',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Color(0xFF7D7F88),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
