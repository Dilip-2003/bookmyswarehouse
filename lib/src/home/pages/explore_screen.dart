import 'package:bookmywarehouse/src/home/widgets/customslider2.dart';
import 'package:bookmywarehouse/src/home/widgets/explore_slider.dart';
import 'package:bookmywarehouse/src/home/widgets/explore_slider_two.dart';
import 'package:bookmywarehouse/src/home/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            const SearchFieldHome(
              colors: Color(0xFFE3E3E7),
              hintText: 'Search address, city, location',
              prefixIcon: Icon(Icons.search),
              suffixIcon: 'assets/images/filter_icon.png',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const CustomSliderTwoHome(title: 'Find out your next Warehouse!'),
            SizedBox(
              height: height * 0.03,
            ),
            const ExploreSlider(title: 'Exploring about your living style?'),
            SizedBox(
              height: height * 0.03,
            ),
            const ExploreSliderTwo(
                title: 'Want to discover other experiences?'),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
