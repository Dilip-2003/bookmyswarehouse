import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.btnText,
    required this.callback,
    required this.color,
    required this.borderColor,
    required this.textColor,
  });

  final String btnText;
  final Color color, borderColor, textColor;
  final VoidCallback callback;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
        widget.callback();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: _isPressed ? widget.borderColor : widget.color,
          borderRadius: BorderRadius.circular(81),
          border: Border.all(width: 1, color: widget.borderColor),
        ),
        child: Center(
          child: Text(
            widget.btnText,
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: _isPressed ? Colors.grey : widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
