import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/recover_text.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/setpassword.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController phoneController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  String enteredOtp = '';
  String actualOtp = '12345';
  bool otpError = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
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
            RecoverText(
              text1: 'Verify Mobile Number',
              text:
                  'Enter the 5-Digit code sent to you at\n ${widget.phoneNumber}',
            ),
            SizedBox(
              height: width * 0.1,
            ),
            SizedBox(
              height: height * 0.1,
              child: OTPTextField(
                controller: otpController,
                length: 5,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hasError: otpError,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 17),
                onChanged: (otp) {
                  setState(() {
                    otpError = false;
                    enteredOtp = otp;
                  });
                },
                onCompleted: (otp) {
                  enteredOtp = otp;
                  if (kDebugMode) {
                    print("Completed: $enteredOtp");
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InkWell(
              onTap: () {
                print('object');

                if (enteredOtp.isNotEmpty) {
                  if (enteredOtp.length == 5) {
                    if (enteredOtp == actualOtp) {
                      print('OTP is valid');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPassword(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'otp does not match\n please entered the otp as 12345'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('otp should be of 5 digit'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                } else {
                  setState(() {
                    otpError = !otpError;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('please enter correct otp'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  });
                }
              },
              child: Container(
                height: height * 0.065,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BasicColor.primary,
                ),
                child: Center(
                  child: Text(
                    'Verify OTP',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.02,
                        color: BasicColor.deepWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Didn’t receive code?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('OTP resend on ${widget.phoneNumber}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text(
                    'Resend again in 0:30 seconds',
                    style: TextStyle(
                      fontSize: 13,
                      // color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
