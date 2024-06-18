import 'package:bookmywarehouse/src/getx/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageNavbar extends StatelessWidget {
  const HomePageNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(
              'Find your place in',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                  letterSpacing: 0.15,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.blue, // Use your desired color
                size: 20,
              ),
              Obx(() {
                return Text(
                  ' ${locationController.cityName.value}',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Use your desired color
                        fontWeight: FontWeight.bold),
                  ),
                );
              }),
              IconButton(
                onPressed: () {
                  locationController.getCurrentLocation();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.black, // Use your desired color
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
