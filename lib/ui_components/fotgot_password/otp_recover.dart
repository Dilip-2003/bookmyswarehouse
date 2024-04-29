import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/recover_text.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RecoverViaOTP extends StatefulWidget {
  const RecoverViaOTP({super.key});

  @override
  State<RecoverViaOTP> createState() => _RecoverViaOTPState();
}

class _RecoverViaOTPState extends State<RecoverViaOTP> {
  TextEditingController phoneController = TextEditingController();
  String? phoneError;
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
            const RecoverText(
                text1: 'Recover Password',
                text: 'Enter your phone number to receive the OTP'),
            SizedBox(
              height: width * 0.1,
            ),
            SizedBox(
              height: height * 0.1,
              child: IntlPhoneField(
                onChanged: (value) {
                  setState(() {
                    phoneError = null;
                  });
                },
                initialCountryCode: 'IN',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                cursorHeight: 20,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Mobile number',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                  errorText: phoneError,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: BasicColor.primary),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InkWell(
              onTap: () {
                print('object');
                String phoneNumber = phoneController.text;
                if (phoneNumber.isEmpty) {
                  setState(() {
                    phoneError = 'phone number could not be empty';
                  });
                } else {
                  print('phone number is valid');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyOTP(
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
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
                    'Send OTP',
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
          ],
        ),
      ),
    );
  }
}
