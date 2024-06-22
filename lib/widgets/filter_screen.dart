import 'package:bookmywarehouse/ui_components/filterScreen/filter_button.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/filter_searchbar.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/header.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/propert_facilities.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/property_type.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/rent_range.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/room_and_bed.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/stay_time.dart';
import 'package:bookmywarehouse/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  Filter({super.key, required this.text});
  final String text;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterSearchBar(
                  text: widget.text,
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Header(
                  title: 'How long do you want to stay?',
                ),
                const SizedBox(height: 10),
                StayTime(),
                SizedBox(
                  height: width * 0.05,
                ),
                Header(
                  title: 'Property Type',
                ),
                const SizedBox(height: 10),
                const PropertyType(),
                SizedBox(
                  height: width * 0.05,
                ),
                const PriceRange(),
                SizedBox(
                  height: width * 0.02,
                ),
                Header(title: 'Rooms and Beds'),
                const RoomAndBed(),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Header(title: 'Property Facilities'),
                    TextButton(
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
                      child: const Text('See more'),
                    ),
                  ],
                ),
                PropertyFacility(),
                const SizedBox(
                  height: 10,
                ),
                FilterButton(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResults(
                            text: widget.text,
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
