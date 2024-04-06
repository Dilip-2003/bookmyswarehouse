import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/propert_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedItem extends StatefulWidget {
  const SavedItem({
    super.key,
  });

  @override
  State<SavedItem> createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.02,
          ),
          child: InkWell(
            onTap: () {
              print('property details clicked');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProperDetailsScreen(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: width * 0.9,
              height: height * 0.25,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/Frame 7.png',
                      height: height * 0.25,
                      width: width * 0.33,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: width * 0.57,
                    padding: EdgeInsets.only(left: width * 0.02),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white24,
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            offset: Offset(4, 1),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              ' ⭐ ',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color: BasicColor.secondary)),
                            ),
                            Text(
                              '4.8 ',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color: BasicColor.lightBlack)),
                            ),
                            Text(
                              '(73) ',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Color(0xFF7D7F88))),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width * 0.5,
                          child: Text(
                            'Warehouse in Ghaziabad',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.13,
                                    color: BasicColor.deepBlack,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Text(
                          'Ghaziabad, NCR',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Color(0xFF7D7F88))),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.house_rounded,
                              color: Colors.grey,
                            ),
                            Text(
                              '988 m2',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14, color: Color(0xFF7D7F88))),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Rs.95,000',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          color: BasicColor.lightBlack)),
                                ),
                                Text(
                                  '/ month',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF7D7F88))),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
