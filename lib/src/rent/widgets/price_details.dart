import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/getx/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceDetails extends StatelessWidget {
  PriceDetails({super.key, required this.rent});
  final String rent;
  final AppServices _appServices = Get.find();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Container(
      height: height * .27,
      width: width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFDFDFD)),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price details',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(
                          0xFF1A1E25,
                        ),
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w700)),
              ),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Under Process",
                    middleText: "This page is under process",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                    },
                  );
                  print('more information clikced');
                },
                child: Text(
                  'More info',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF917AFD),
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.06,
                width: width * 0.5,
                child: Text(
                  'Staying duration (${_appServices.noofDays.value} days)',
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
              Text(
                'Rs. ${int.parse(rent) * _appServices.noofDays.value}',
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Service Tax',
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
              Text(
                'Rs. ${int.parse(rent) * _appServices.noofDays.value * 0.03}',
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: BasicColor.deepBlack,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              Text(
                'Rs. ${int.parse(rent) * _appServices.noofDays.value + int.parse(rent) * _appServices.noofDays.value * 0.03}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: BasicColor.primary,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
