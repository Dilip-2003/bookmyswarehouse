import 'package:bookmywarehouse/src/getx/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputDetails extends StatelessWidget {
  InputDetails({
    super.key,
  });
  AppServices _appServices = Get.find();

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
                'Your input details',
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
                  print('edit option clikced');
                },
                child: Text(
                  'Edit',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Of Days',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFF1A1E25,
                      ),
                      letterSpacing: 0.02,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => Text(
                  '${_appServices.noofDays} Days',
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
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guests Count',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xFF1A1E25,
                      ),
                      letterSpacing: 0.02,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Obx(
                () => Text(
                  '${_appServices.noofGuest} guests',
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
