import 'package:bookmywarehouse/src/warehouse/widgets/house_facility.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/map.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/neighboour.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/owner_details.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/property_details_slider.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/public_facility.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/rent_button.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/testimonials.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/warehouse_details.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/watch_360.dart';
import 'package:flutter/material.dart';

class ProperDetailsScreen extends StatefulWidget {
  const ProperDetailsScreen({super.key});

  @override
  State<ProperDetailsScreen> createState() => _ProperDetailsScreenState();
}

class _ProperDetailsScreenState extends State<ProperDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProDetailsSlider(),
            SizedBox(
              height: 15,
            ),
            Watch360(),
            SizedBox(
              height: 25,
            ),
            WareHouseDetais(),
            SizedBox(
              height: 15,
            ),
            OwnerDetails(),
            SizedBox(
              height: 15,
            ),
            WareHouseFacility(),
            SizedBox(
              height: 15,
            ),
            MapPropertDetails(),
            SizedBox(
              height: 15,
            ),
            PublicFacilities(),
            SizedBox(
              height: 15,
            ),
            NeighBour(),
            SizedBox(
              height: 15,
            ),
            TestiMonials(),
            SizedBox(
              height: 25,
            ),
            RentButton(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
