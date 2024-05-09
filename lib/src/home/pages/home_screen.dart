import 'package:bookmywarehouse/src/home/widgets/banner.dart';
import 'package:bookmywarehouse/src/home/widgets/home_page_appbar.dart';
import 'package:bookmywarehouse/src/home/widgets/customslider.dart';
import 'package:bookmywarehouse/src/home/widgets/customslider2.dart';
import 'package:bookmywarehouse/src/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          const HomePageNavbar(),
          const SearchFieldHome(
            colors: Color(0xFFE3E3E7),
            hintText: 'Search address, city, location',
            prefixIcon: Icon(Icons.search),
            suffixIcon: 'assets/images/filter_icon.png',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const CustomSliderHome(
            title: 'Near your location',
            subTitle: ' properties in India',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const CustomSliderHome(
            title: 'Top rated in NCR',
            subTitle: '',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const CustomSliderTwoHome(
            title: 'Find out your next Warehouse!',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const BannerHome(),
        ],
      ),
    );
  }
}
