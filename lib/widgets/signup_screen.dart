import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/divider.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/email_text_field.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/google_signin_button.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/login_button.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/password_text_field.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/phone_text_field.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/sign_in_button.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/welcome.dart';
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
              EmailTextComponents(
                userName: 'Username',
                icons: Icon(
                  Icons.person,
                  color: BasicColor.primary,
                  size: 22,
                ),
                emailText: 'ricozindia@gmail.com',
                colors: const Color(0xFFF1F1FE),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const PasswordTextComponents(
                userName: 'Password',
                icons: Icon(
                  Icons.key,
                  color: Color(0xFF7D7F88),
                  size: 22,
                ),
                emailText: 'Insert your password here',
                colors: Color(0xFFF2F2F3),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const PhoneTextField(
                userName: 'Phone number',
                emailText: 'Enter your phone number',
                colors: Color(0xFFF2F2F3),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LoginButton(
                borderColor: BasicColor.primary,
                textColor: const Color(0xFFFFFFFF),
                color: BasicColor.primary,
                btnText: 'Create account',
                callback: () {
                  print('login button pressed');
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const DividerOR(),
              SizedBox(
                height: height * 0.02,
              ),
              const SignInButton(
                btnText: 'Sign in with Apple',
                colors: Color(0xFF222831),
                borderColors: Color(0xFF222831),
              ),
              SizedBox(
                height: height * 0.02,
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
