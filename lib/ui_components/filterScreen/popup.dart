import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/getx/getx_controller.dart';
import 'package:bookmywarehouse/src/rent/pages/checkout.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/header.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/propert_facilities.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/room_and_bed.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/stay_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpScreen extends StatefulWidget {
  PopUpScreen({Key? key}) : super(key: key);

  @override
  State<PopUpScreen> createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  TextEditingController noOfGuestController = TextEditingController();

  int selectedDays = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: 'How long do you want to stay?',
              ),
              const SizedBox(height: 10),
              StayTime(),
              SizedBox(height: width * 0.05),
              Header(title: 'No of Guests'),
              SizedBox(height: width * 0.05),
              TextField(
                controller: noOfGuestController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: width * 0.05),
              Header(title: 'Rooms and Beds'),
              const RoomAndBed(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Header(title: 'Property Facilities'),
                  TextButton(
                    onPressed: () {
                      print(selectedDays);
                    },
                    child: const Text('See more'),
                  ),
                ],
              ),
              PropertyFacility(),
              const SizedBox(height: 10),
              RentButton(
                guest: noOfGuestController.text,
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class RentButton extends StatelessWidget {
  RentButton({Key? key, required this.guest}) : super(key: key);

  final String guest;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        int? parsedGuests = int.tryParse(guest);

        if (parsedGuests != null) {
          AppServices _appServices = Get.find();
          _appServices.guestUpdate(parsedGuests);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckOut(),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Invalid Input'),
                content: Text('Please enter a valid number of guests.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Center(
        child: Container(
          height: height * 0.06,
          width: width * 0.3,
          decoration: BoxDecoration(
            color: BasicColor.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Rent',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,
                color: BasicColor.deepWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
