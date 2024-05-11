import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bookmywarehouse/widgets/navigation_page.dart';
import 'package:bookmywarehouse/src/auth/widgets/email_text_field.dart';

class MailAndPasswordVerification extends StatefulWidget {
  const MailAndPasswordVerification({Key? key}) : super(key: key);

  @override
  State<MailAndPasswordVerification> createState() =>
      _MailAndPasswordVerificationState();
}

class _MailAndPasswordVerificationState
    extends State<MailAndPasswordVerification> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String? emailError;
  String? passwordError;
  bool _loggingIn = false;

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      emailError = null;
      passwordError = null;
    });

    if (email.trim().isEmpty || !email.contains('@') || !email.contains('.')) {
      setState(() {
        emailError = 'Enter a valid email address';
      });
      return;
    }

    if (password.trim().isEmpty || password.length < 8) {
      setState(() {
        passwordError = 'Password should be at least 8 characters';
      });
      return;
    }

    try {
      setState(() {
        _loggingIn = true;
      });

      // Perform Firebase login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the next page on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } catch (e) {
      print(e);
      setState(() {
        _loggingIn = false;
        emailError = 'Login failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.322,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EmailTextComponents(
              userName: 'Username',
            ),
            SizedBox(
              height: height * 0.07,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    emailError = null;
                  });
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF1F1FE),
                  prefixIcon: Icon(
                    Icons.person,
                    color: BasicColor.primary,
                    size: 22,
                  ),
                  hintText: 'ricozindia@gmail.com',
                  errorText: emailError,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(81),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const EmailTextComponents(
              userName: 'Password',
            ),
            SizedBox(
              height: height * 0.07,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    passwordError = null;
                  });
                },
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F3),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF7D7F88),
                    size: 22,
                  ),
                  errorText: passwordError,
                  hintText: 'Insert your password here',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(81),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.035,
            ),
            GestureDetector(
              onTap: _loggingIn ? null : _login,
              child: Material(
                elevation: _loggingIn ? 0 : 4,
                borderRadius: BorderRadius.circular(81),
                color: BasicColor.primary,
                child: Container(
                  height: height * 0.07,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(81),
                  ),
                  child: Center(
                    child: _loggingIn
                        ? const SpinKitCircle(
                            color: Colors.white, // Choose your desired color
                            size: 30.0, // Adjust the size as needed
                          )
                        : Text(
                            'Log in',
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              ),
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
