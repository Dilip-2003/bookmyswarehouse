import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Card(
          color: BasicColor.deepWhite,
          child: Container(
            height: height * 0.4,
            width: width * 0.7,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/images/send.json',
                  height: width * 0.3,
                  width: width * 0.3,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Email Sent',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                      color: BasicColor.primary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'We have successfully sent you the reset password link. Kindly check your email.',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.02,
                      color: BasicColor.deepBlack,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    print('recover email sent');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreens(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BasicColor.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.02,
                            color: BasicColor.deepWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
