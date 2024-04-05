import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.userName,
    required this.emailText,
    required this.colors,
  });

  final String emailText, userName;
  final Color colors;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.userName,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Color(0xFF1A1E25),
              ),
            ),
          ),
          const SizedBox(height: 8),
          IntlPhoneField(
            controller: phoneController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: widget.emailText,
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
        ],
      ),
    );
  }
}
