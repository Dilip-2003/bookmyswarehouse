import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/email_recover.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/options_card.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/otp_recover.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/recover_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverOptions extends StatefulWidget {
  const RecoverOptions({super.key});

  @override
  State<RecoverOptions> createState() => _RecoverOptionsState();
}

class _RecoverOptionsState extends State<RecoverOptions> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.1),
          child: Text(
            'Forgot Password',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.02,
                color: BasicColor.deepBlack,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * .05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RecoverText(
                text1: 'Recover Password',
                text: 'Please select option to reset your password'),
            SizedBox(
              height: width * 0.1,
            ),
            RecoverOptionsCard(
              txt1: 'Reset via email',
              txt2: 'If your email has linked to account',
              icon: Icon(
                Icons.email_outlined,
                size: 30,
                color: BasicColor.primary,
              ),
              callback: () {
                print('go to recover through email sections');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecoverViaEmail(),
                  ),
                );
              },
            ),
            SizedBox(
              height: width * 0.05,
            ),
            RecoverOptionsCard(
              txt1: 'Reset via SMS',
              txt2: 'If your number has linked to account',
              icon: Icon(
                Icons.phone_android_outlined,
                size: 30,
                color: BasicColor.primary,
              ),
              callback: () {
                print('go to recover through phone number sections');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecoverViaOTP(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
