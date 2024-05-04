import 'package:bookmywarehouse/src/home/widgets/explore_slider.dart';
import 'package:bookmywarehouse/src/home/widgets/explore_slider_two.dart';
import 'package:bookmywarehouse/src/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

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
            const SearchFieldHome(
              colors: Color(0xFFE3E3E7),
              hintText: 'Search address, city, location',
              prefixIcon: Icon(Icons.search),
              suffixIcon: 'assets/images/filter_icon.png',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSliderTwo(
              title: 'Find out your next Warehouse!',
              subTitle2: '345 rented props ',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSlider(
              title: 'Exploring about your living style?',
              city: 'Kolkata',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSlider(
              title: 'Want to discover other experiences?',
              city: 'Hydrabad',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSlider(
              title: 'Find out your next Warehouse!',
              city: 'Bangalore',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSlider(
              title: 'Exploring about your living style?',
              city: 'Kolkata',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const ExploreSlider(
              title: 'Want to discover other experiences?',
              city: 'Hydrabad',
            ),
          ],
        ),
      ),
    );
  }
}
