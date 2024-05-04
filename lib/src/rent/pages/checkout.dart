import 'package:bookmywarehouse/src/rent/widgets/booking_button.dart';
import 'package:bookmywarehouse/src/rent/widgets/checkout_appbar.dart';
import 'package:bookmywarehouse/src/rent/widgets/house_details.dart';
import 'package:bookmywarehouse/src/rent/widgets/input_details.dart';
import 'package:bookmywarehouse/src/rent/widgets/payment_gateway.dart';
import 'package:bookmywarehouse/src/rent/widgets/policies.dart';
import 'package:bookmywarehouse/src/rent/widgets/price_details.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const CustomCheckOutAppBar(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HouseDetails(),
                SizedBox(
                  height: height * 0.02,
                ),
                const InputDetails(),
                SizedBox(
                  height: height * 0.02,
                ),
                const PriceDetails(),
                SizedBox(
                  height: height * 0.02,
                ),
                const PayMentGateWay(),
                SizedBox(
                  height: height * 0.02,
                ),
                const Policy(),
                SizedBox(
                  height: height * 0.04,
                ),
                const BookingButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
