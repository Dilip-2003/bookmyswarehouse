import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PayMentGateWay extends StatelessWidget {
  const PayMentGateWay({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * .35,
      width: width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFDFDFD)),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pay With',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(
                      0xFF1A1E25,
                    ),
                    letterSpacing: 0.02,
                    fontWeight: FontWeight.w700)),
          ),
          const DebitCard(),
          OnlinePayment(
            imgUrls: 'assets/images/googleImg.svg',
            methodOfPayment: 'Google Pay',
          ),
          OnlinePayment(
            imgUrls: 'assets/images/appleLogo.svg',
            methodOfPayment: 'Apple Pay',
          ),
          OnlinePayment(
            imgUrls: 'assets/images/paypalLogo.svg',
            methodOfPayment: 'PayPal',
          ),
        ],
      ),
    );
  }
}

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.credit_card_rounded,
          size: 30,
        ),
        SizedBox(
          width: width * 0.72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.06,
                width: width * 0.59,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debit Card',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 17,
                          color: BasicColor.lightBlack,
                          letterSpacing: 0.02,
                        ),
                      ),
                    ),
                    Text(
                      'Accepting Visa, Mastercard, etc',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          color: Color(
                            0xFF7D7F88,
                          ),
                          letterSpacing: 0.02,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  print('Circular add pressed');
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class OnlinePayment extends StatelessWidget {
  OnlinePayment({
    super.key,
    required this.imgUrls,
    required this.methodOfPayment,
  });
  String imgUrls, methodOfPayment;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(imgUrls),
        SizedBox(
          width: width * 0.72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.06,
                width: width * 0.59,
                child: Text(
                  methodOfPayment,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(
                        0xFF7D7F88,
                      ),
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
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
                  print('Circular add pressed');
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
