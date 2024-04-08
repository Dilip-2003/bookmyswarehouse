import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyFacility extends StatefulWidget {
  @override
  State<PropertyFacility> createState() => _PropertyFacilityState();
}

class _PropertyFacilityState extends State<PropertyFacility> {
  final List<String> textValues = [
    'Any',
    'WiFi',
    'Self Check-in',
    'Kitchen',
    'Free Parking',
    'Security',
    'Air Conditioner',
  ];

  final List<int> containerCountsPerRow = [3, 2, 1, 1];

  List<bool> isSelectedList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int currentIndex = 0; // Initialize a single index

    return Column(
      children: List.generate(
        containerCountsPerRow.length,
        (rowIndex) => Row(
          children: List.generate(
            containerCountsPerRow[rowIndex],
            (columnIndex) {
              final index = currentIndex++;
              return InkWell(
                onTap: () {
                  setState(() {
                    isSelectedList[index] = !isSelectedList[index];
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: isSelectedList[index]
                        ? BasicColor.primary
                        : const Color(0xFFE3E3E7),
                  ),
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5, top: 5),
                  child: Center(
                    child: Text(
                      textValues[index],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.02,
                          color: isSelectedList[index]
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
