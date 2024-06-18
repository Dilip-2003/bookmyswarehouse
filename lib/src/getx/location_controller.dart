import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  var cityName = 'Your Location'.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('permission not granted');
      LocationPermission askPermission = await Geolocator.requestPermission();
      if (askPermission == LocationPermission.whileInUse ||
          askPermission == LocationPermission.always) {
        _fetchLocation();
      }
    } else {
      _fetchLocation();
    }
  }

  _fetchLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(currentPosition.latitude);
    print(currentPosition.longitude);

    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);

    cityName.value = placemarks.first.locality ?? 'Your Location';
  }
}
