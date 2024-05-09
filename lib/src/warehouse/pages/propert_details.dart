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
  const ProperDetailsScreen({super.key, required this.warehouse});
  final Map<String, dynamic> warehouse;

  @override
  State<ProperDetailsScreen> createState() => _ProperDetailsScreenState();
}

class _ProperDetailsScreenState extends State<ProperDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProDetailsSlider(
              imgList: widget.warehouse['imageList'],
            ),
            const SizedBox(
              height: 15,
            ),
            const Watch360(),
            const SizedBox(
              height: 25,
            ),
            WareHouseDetais(
              address: widget.warehouse['address'],
              area: widget.warehouse['area'],
              reviewers: widget.warehouse['reviewers'],
              stars: widget.warehouse['stars'],
              title: widget.warehouse['title'],
            ),
            const SizedBox(
              height: 15,
            ),
            OwnerDetails(
              ownerName: widget.warehouse['ownerdetails']['name'],
              ownerPhone: widget.warehouse['ownerdetails']['phone'],
            ),
            const SizedBox(
              height: 15,
            ),
            const WareHouseFacility(),
            const SizedBox(
              height: 15,
            ),
            const MapPropertDetails(),
            const SizedBox(
              height: 15,
            ),
            PublicFacilities(
              canteenDis: widget.warehouse['facilities']['canteen'],
              hospitalDis: widget.warehouse['facilities']['hospital'],
              marketDis: widget.warehouse['facilities']['market'],
              trainDis: widget.warehouse['facilities']['train'],
            ),
            const SizedBox(
              height: 15,
            ),
            const NeighBour(),
            const SizedBox(
              height: 15,
            ),
            const TestiMonials(),
            const SizedBox(
              height: 25,
            ),
            RentButton(
              warehouse: widget.warehouse,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
