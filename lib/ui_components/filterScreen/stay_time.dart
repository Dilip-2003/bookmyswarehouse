import 'package:bookmywarehouse/src/getx/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StayTime extends StatefulWidget {
  StayTime({
    super.key,
  });

  @override
  State<StayTime> createState() => _StayTimeState();
}

class _StayTimeState extends State<StayTime> {
  final DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  bool isCalendarVisible = false;
  final AppServices _appServices = Get.find();
  int selectedDays = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.05, // Adjusted height
          width: width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isCalendarVisible = !isCalendarVisible;
                  });
                },
                icon: const Icon(
                  Icons.calendar_today,
                  size: 30,
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isCalendarVisible = !isCalendarVisible;
                      });
                    },
                    child: Text(
                      _appServices.noofDays > 0
                          ? '${_appServices.noofDays} Days'
                          : "0 Days",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    )),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isCalendarVisible,
          child: SizedBox(
            height: height * 0.5, // Adjusted height
            child: SfDateRangePicker(
              rangeSelectionColor: Colors.blue,
              controller: dateRangePickerController,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              headerHeight: height * 0.075,
              showActionButtons: true,
              showNavigationArrow: true,
              onCancel: () {
                setState(() {
                  isCalendarVisible = false;
                  selectedDays = 0;
                  _appServices.noofDays = RxInt(selectedDays);
                });
              },
              onSubmit: (value) {
                print(value);
                setState(() {
                  isCalendarVisible = false;
                  if (value is PickerDateRange) {
                    DateTime startDate = value.startDate!;
                    DateTime endDate = value.endDate!;
                    selectedDays = endDate.difference(startDate).inDays + 1;
                    _appServices.dayUpdate(selectedDays);
                  } else {
                    selectedDays = 0;
                    _appServices.noofDays = RxInt(0);
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
