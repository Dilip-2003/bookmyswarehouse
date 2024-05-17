import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/data/datalist.dart';
import 'package:bookmywarehouse/src/warehouse/pages/propert_details.dart';
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
  List<Map<String, dynamic>> houseList = WareHouseList.warehouseList;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: houseList.length,
      itemBuilder: (context, index) {
        return Container(
          child: PropertyCard(
            warehouse: houseList[index],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class PropertyCard extends StatefulWidget {
  PropertyCard({
    super.key,
    required this.warehouse,
  });
  Map<String, dynamic> warehouse;

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('property details clicked');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProperDetailsScreen(
              warehouse: widget.warehouse,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.01,
        ),
        width: width * 0.86,
        height: height * 0.2,
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    widget.warehouse['image'],
                    height: height * 0.22,
                    width: width * 0.33,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: width * 0.53,
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
                                    fontSize: 12, color: BasicColor.secondary)),
                          ),
                          Text(
                            widget.warehouse['stars'],
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: BasicColor.lightBlack)),
                          ),
                          Text(
                            '(${widget.warehouse['reviewers']}) ',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 12, color: Color(0xFF7D7F88))),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          widget.warehouse['title'],
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.13,
                                  color: BasicColor.deepBlack,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Text(
                        widget.warehouse['address'],
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
                            '${widget.warehouse['area']} sq. metre',
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
                                'Rs. ${widget.warehouse['rent']}',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: BasicColor.lightBlack),
                                ),
                              ),
                              Text(
                                '/ day',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF7D7F88),
                                  ),
                                ),
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
            Positioned(
              bottom: 0,
              right: width * 0.05,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    print('object');
                    isFav = !isFav;
                  });
                },
                icon: isFav
                    ? Icon(
                        Icons.favorite,
                        size: 25,
                        color: BasicColor.primary,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 25,
                        color: Color(0xFF7D7F88),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
