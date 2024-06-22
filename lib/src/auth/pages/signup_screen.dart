import 'package:bookmywarehouse/src/auth/widgets/divider.dart';
import 'package:bookmywarehouse/src/auth/widgets/google_signin_button.dart';
import 'package:bookmywarehouse/src/auth/widgets/sign_in_button.dart';
import 'package:bookmywarehouse/src/auth/widgets/signupwith_verification.dart';
import 'package:bookmywarehouse/src/auth/widgets/welcome.dart';
import 'package:flutter/material.dart';

class SignUpScreens extends StatelessWidget {
  const SignUpScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: width * 0.1,
            weight: 1.0,
            color: const Color(0xFF1A1E25),
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeColum(
                text1: 'Let’s explore together!',
                text2:
                    'Create your Placoo account to explore your dream place to live across the whole world!',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const SignUpWithVerifications(),
              const DividerOR(),
              SizedBox(
                height: height * 0.02,
              ),
              // const SignInButton(
              //   btnText: 'Sign up with Apple',
              //   colors: Color(0xFF222831),
              //   borderColors: Color(0xFF222831),
              // ),
              SizedBox(
                height: height * 0.02,
              ),
              const GooogleSignInButton(
                btnText: 'Sign up with Google',
                colors: Color(0xFFFFFFFF),
                borderColors: Color(0xFFE2E8F0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
