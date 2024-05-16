import 'package:bookmywarehouse/ui_components/fotgot_password/recover_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import '../../constants/color/base_color.dart';
import 'email_confirmation.dart'; // Ensure this path is correct

class RecoverViaEmail extends StatefulWidget {
  RecoverViaEmail({super.key});

  @override
  State<RecoverViaEmail> createState() => _RecoverViaEmailState();
}

class _RecoverViaEmailState extends State<RecoverViaEmail> {
  TextEditingController emailController = TextEditingController();
  String? emailError;
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _sendPasswordResetEmail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EmailSent(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        switch (e.code) {
          case 'invalid-email':
            emailError = 'The email address is not valid.';
            break;
          case 'user-not-found':
            emailError = 'There is no user corresponding to this email.';
            break;
          default:
            emailError = 'An error occurred. Please try again.';
            break;
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        emailError = 'An unknown error occurred. Please try again.';
      });
    }
  }

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
        margin: EdgeInsets.symmetric(horizontal: width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecoverText(
              text1: 'Recover Password',
              text: 'Enter your email address to recover your password',
            ),
            SizedBox(height: width * 0.1),
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
                cursorHeight: 20,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter your email',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: BasicColor.primary,
                    size: 25,
                  ),
                  errorText: emailError,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: BasicColor.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: height * 0.05),
            InkWell(
              onTap: () {
                String email = emailController.text;
                final bool isEmailValid = EmailValidator.validate(email.trim());
                if (email.isEmpty) {
                  setState(() {
                    emailError = 'Email cannot be empty';
                  });
                } else if (isEmailValid) {
                  _sendPasswordResetEmail();
                } else {
                  setState(() {
                    emailError = 'Please enter a valid email';
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
                  child: _isLoading
                      ? CircularProgressIndicator(color: BasicColor.deepWhite)
                      : Text(
                          'Send Reset Link',
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

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
