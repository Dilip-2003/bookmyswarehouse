import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/fotgot_password/recover_text.dart';
import 'package:bookmywarehouse/src/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  String? errorTxt1, errorTxt2;
  String enteredOtp = '';
  String actualOtp = '12345';
  bool otpError = false;
  bool obscureTxt1 = true, obscureTxt2 = true;
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * .05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RecoverText(
                text1: 'Set New Password',
                text:
                    'Enter new strong and secure password that protects your account',
              ),
              SizedBox(
                height: width * 0.1,
              ),
              TextField(
                controller: passwordController1,
                onChanged: (value) {
                  setState(() {
                    errorTxt1 = null;
                  });
                },
                keyboardType: TextInputType.text,
                obscureText: obscureTxt1,
                onSubmitted: (value) {
                  if (value.length < 8) {
                    setState(() {
                      errorTxt1 =
                          'password length should be greater than or equal to 8';

                      // errorTxt2 =
                      //     'password length should be greater than or equal to 8';
                    });
                  }
                },
                decoration: InputDecoration(
                    errorText: errorTxt1,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                controller: passwordController2,
                keyboardType: TextInputType.text,
                obscureText: obscureTxt2,
                onChanged: (value) {
                  setState(() {
                    errorTxt2 = null;
                  });
                },
                onSubmitted: (value) {
                  if (value == passwordController1.text) {
                    setState(() {
                      errorTxt2 = null;
                    });
                  } else {
                    setState(() {
                      errorTxt2 = 'password not matched';
                    });
                  }
                },
                decoration: InputDecoration(
                    errorText: errorTxt2,
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  print('password updated successfully');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreens(),
                      ));
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
                      'Continue',
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
      ),
    );
  }
}
