import 'package:get/get.dart';

class AppServices extends GetxController {
  var noofDays = 0.obs;
  var noofGuest = 0.obs;
  dayUpdate(days) {
    noofDays.value = days;
  }

  guestUpdate(guest) {
    noofGuest.value = guest;
  }
}
