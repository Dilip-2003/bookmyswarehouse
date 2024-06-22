import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckOutAppBar extends StatelessWidget {
  const CustomCheckOutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rent booking',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(
                    0xFF1A1E25,
                  ),
                  letterSpacing: 0.02,
                  fontWeight: FontWeight.w700)),
        ),
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Under Process",
              middleText: "This page is under process",
              textConfirm: "OK",
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              },
            );
          },
          icon: Icon(
            Icons.help_center,
            size: 30,
          ),
        )
      ],
    );
  }
}
