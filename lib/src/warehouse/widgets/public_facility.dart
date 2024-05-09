import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicFacilities extends StatelessWidget {
  PublicFacilities({
    super.key,
    required this.marketDis,
    required this.canteenDis,
    required this.hospitalDis,
    required this.trainDis,
  });

  final String marketDis, hospitalDis, canteenDis, trainDis;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width * 0.9,
      height: height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Nearest public facilities',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: BasicColor.deepBlack)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FacitlityItem(
                    title: 'Minimarket',
                    distance: marketDis,
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Color(0xFF7D7F88),
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FacitlityItem(
                    title: 'Hospital',
                    distance: hospitalDis,
                    icon: const Icon(
                      Icons.local_hospital,
                      color: Color(0xFF7D7F88),
                      size: 24,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FacitlityItem(
                    title: 'Public Canteen',
                    distance: canteenDis,
                    icon: const Icon(
                      Icons.restaurant,
                      color: Color(0xFF7D7F88),
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FacitlityItem(
                    title: 'Train',
                    distance: trainDis,
                    icon: const Icon(
                      Icons.train,
                      color: Color(0xFF7D7F88),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FacitlityItem extends StatelessWidget {
  const FacitlityItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.distance});
  final String title, distance;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: BasicColor.deepBlack)),
              ),
              Text(
                distance,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                )),
              )
            ],
          ),
        )
      ],
    );
  }
}
