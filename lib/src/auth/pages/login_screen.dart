import 'package:bookmywarehouse/src/auth/widgets/divider.dart';
import 'package:bookmywarehouse/src/auth/widgets/forgot_password.dart';
import 'package:bookmywarehouse/src/auth/widgets/google_signin_button.dart';
import 'package:bookmywarehouse/src/auth/widgets/mail_password.dart';
import 'package:bookmywarehouse/src/auth/widgets/sign_in_button.dart';
import 'package:bookmywarehouse/src/auth/widgets/singin_with_phn.dart';
import 'package:bookmywarehouse/src/auth/widgets/welcome.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

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
                text1: 'Welcome!',
                text2:
                    'Log In to your account to explore your dream Warehouse !',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const MailAndPasswordVerification(),
              SizedBox(
                height: height * 0.015,
              ),
              const ForgotPassWord(),
              SizedBox(
                height: height * 0.015,
              ),
              const DividerOR(),
              SizedBox(
                height: height * 0.015,
              ),
              const SignInWithPhone(
                btnText: 'Sign in with Phone Number',
                colors: Color(0xFFFFFFFF),
                borderColors: Color(0xFFE2E8F0),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              const SignInButton(
                btnText: 'Sign in with Apple',
                colors: Color(0xFF222831),
                borderColors: Color(0xFF222831),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              const GooogleSignInButton(
                btnText: 'Sign in with Google',
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
