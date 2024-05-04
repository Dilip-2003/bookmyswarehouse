import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageNavbar extends StatefulWidget {
  const HomePageNavbar({Key? key}) : super(key: key);

  @override
  State<HomePageNavbar> createState() => _HomePageNavbarState();
}

class _HomePageNavbarState extends State<HomePageNavbar> {
  String cityName = 'Your Location';

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('permission not granted');
      // LocationPermission askPermission = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print(currentPosition.latitude);
      print(currentPosition.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      setState(() {
        cityName = placemarks.first.locality ?? 'Your Location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(
              'Find your place in',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                  letterSpacing: 0.15,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.blue, // Use your desired color
                size: 20,
              ),
              Text(
                ' $cityName',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black, // Use your desired color
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  getCurrentLocation();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.black, // Use your desired color
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
