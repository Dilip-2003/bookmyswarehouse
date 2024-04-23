import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/login_signup_page/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({
    Key? key,
    required this.btnText,
    required this.colors,
    required this.borderColors,
  }) : super(key: key);

  final String btnText;
  final Color colors, borderColors;

  @override
  _SignInWithPhoneState createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        _navigateToOtpScreen(context);
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey.withOpacity(0.5) : widget.colors,
          borderRadius: BorderRadius.circular(81),
          border: Border.all(
            width: 1,
            color:
                _isPressed ? Colors.grey.withOpacity(0.5) : widget.borderColors,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.1,
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                Icons.phone_android,
                color: Colors.black.withOpacity(0.7),
                size: 30,
              ),
            ),
            SizedBox(
              width: width * 0.75,
              child: Center(
                child: Text(
                  widget.btnText,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF475569),
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

  void _navigateToOtpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          userName: 'Phone Number',
          icons: Icon(Icons.phone_android),
          emailText: '9867653250',
          colors: BasicColor.deepWhite,
        ),
      ),
    );
  }
}
