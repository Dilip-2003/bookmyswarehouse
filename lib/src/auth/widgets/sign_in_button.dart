import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({
    Key? key,
    required this.btnText,
    required this.colors,
    required this.borderColors,
  }) : super(key: key);

  final String btnText;
  final Color colors, borderColors;

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
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
        print('sign in with apple button pressed');
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
              width: width * 0.05,
              padding: const EdgeInsets.only(left: 15),
              child: const Icon(
                Icons.apple,
                size: 24,
                color: Color(0xFFFFFFFF),
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
                      color: Color(0xFFFFFFFF),
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
