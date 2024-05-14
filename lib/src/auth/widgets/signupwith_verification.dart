import 'package:bookmywarehouse/widgets/navigation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/auth/widgets/email_text_field.dart';

class SignUpWithVerifications extends StatefulWidget {
  const SignUpWithVerifications({super.key});

  @override
  State<SignUpWithVerifications> createState() =>
      _SignUpWithVerificationsState();
}

class _SignUpWithVerificationsState extends State<SignUpWithVerifications> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isPasswordVisible = false;
  String? emailError;
  String? passwordError;
  String? phoneError;
  bool _creatingAccount = false;

  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp();
  }

  void _createAccount() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      if (email.contains('@') && email.contains('.')) {
        if (password.length >= 8) {
          setState(() {
            _creatingAccount = true;
          });

          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Optionally, you can also verify the user's phone number here.

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(),
            ),
          );
        } else {
          setState(() {
            passwordError = 'Password should be at least 8 characters';
          });
        }
      } else {
        setState(() {
          emailError = 'Enter a valid email';
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _creatingAccount = false;
        if (e.code == 'weak-password') {
          passwordError = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          emailError = 'The account already exists for that email.';
        } else {
          emailError = 'Error: ${e.message}';
        }
      });
    } catch (e) {
      setState(() {
        _creatingAccount = false;
        emailError = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.5,
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
            height: height * 0.02,
          ),
          const EmailTextComponents(userName: 'Phone number'),
          IntlPhoneField(
            onChanged: (value) {
              setState(() {
                phoneError = null;
              });
            },
            keyboardType: TextInputType.number,
            onSubmitted: (p0) {},
            controller: phoneController,
            initialCountryCode: 'IN',
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Enter your phone number',
              errorText: phoneError,
              hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                ),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFE3E3E7), width: 1),
                borderRadius: BorderRadius.circular(81),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: _creatingAccount ? null : _createAccount,
            child: Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: BasicColor.primary,
                borderRadius: BorderRadius.circular(81),
                border: Border.all(
                  width: 1,
                  color: BasicColor.primary,
                ),
              ),
              child: Center(
                child: _creatingAccount
                    ? const SpinKitCircle(
                        color: Colors.white, // Choose your desired color
                        size: 30.0, // Adjust the size as needed
                      )
                    : Text(
                        'Create account',
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
        ],
      ),
    );
  }
}
