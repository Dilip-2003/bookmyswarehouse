import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyType extends StatefulWidget {
  const PropertyType({Key? key}) : super(key: key);

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType> {
  List<bool> isSelectedList = List.generate(10, (index) => false);
  List<String> propertyList = [
    'Any',
    'Warehouse',
    'Studio',
    'Any',
    'Warehouse',
    'Studio',
    'Any',
    'Warehouse',
    'Studio',
    'Any'
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.06,
          width: width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  isSelectedList[index] = !isSelectedList[index];
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: isSelectedList[index]
                      ? BasicColor.primary
                      : const Color(0xFFE3E3E7),
                ),
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Center(
                  child: Text(
                    propertyList[index],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.02,
                        color: isSelectedList[index]
                            ? BasicColor.deepWhite
                            : BasicColor.lightBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
