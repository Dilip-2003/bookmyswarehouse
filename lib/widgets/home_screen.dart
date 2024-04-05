import 'package:bookmywarehouse/ui_components/homepage/banner.dart';
import 'package:bookmywarehouse/ui_components/homepage/home_page_appbar.dart';
import 'package:bookmywarehouse/ui_components/homepage/customslider.dart';
import 'package:bookmywarehouse/ui_components/homepage/customslider2.dart';
import 'package:bookmywarehouse/ui_components/homepage/search_field.dart';
import 'package:bookmywarehouse/ui_components/homepage/switch_bar.dart';
import 'package:bookmywarehouse/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const HomePageNavbar(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const SearchFieldHome(
              colors: Color(0xFFE3E3E7),
              hintText: 'Search address, city, location',
              prefixIcon: Icon(Icons.search),
              suffixIcon: 'assets/images/filter_icon.png',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                'What do you need?',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1A1E25),
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SwitchBarHome(),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CustomSliderHome(
              title: 'Near your location',
              subTitle: '243 properties in India',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CustomSliderHome(
              title: 'Top rated in NCR',
              subTitle: ' ',
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
      ),
    );
  }
}
