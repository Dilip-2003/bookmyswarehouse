import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GooogleSignInButton extends StatefulWidget {
  const GooogleSignInButton({
    Key? key,
    required this.btnText,
    required this.colors,
    required this.borderColors,
  }) : super(key: key);

  final String btnText;
  final Color colors, borderColors;

  @override
  _GooogleSignInButtonState createState() => _GooogleSignInButtonState();
}

class _GooogleSignInButtonState extends State<GooogleSignInButton> {
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
        print('Google Sign-In button pressed');
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
              child: Image.asset(
                'assets/images/Icon.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
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
}
