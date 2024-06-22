import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});
  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    TextEditingController feedbackText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(text: 'Feedback'),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FeedbackText(
                  text:
                      'Share your feedback with us to help improve Warehouse on Hire:'),
              SizedBox(
                height: height * 0.03,
              ),
              const FeedbackText(text: 'Please enter your feedback here:'),
              SizedBox(
                height: height * 0.03,
              ),
              TextFieldCard(
                feedbackText: feedbackText,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.65,
                child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Under Process",
                      middleText: "This page is under process",
                      textConfirm: "OK",
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Get.back();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.file_open,
                        size: 30,
                      ),
                      Text(
                        'Attach File (Optional)',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: BasicColor.deepBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                decoration: BoxDecoration(
                    color: BasicColor.primary,
                    borderRadius: BorderRadius.circular(
                      10,
                    )),
                width: width * 0.9,
                height: height * 0.07,
                child: TextButton(
                  onPressed: () {
                    print(feedbackText.text.toString());
                    print('feed back submit');
                    Get.back();
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: BasicColor.deepWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackText extends StatelessWidget {
  const FeedbackText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: BasicColor.deepBlack,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldCard extends StatelessWidget {
  TextFieldCard({super.key, required this.feedbackText});
  TextEditingController feedbackText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width * 0.9,
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: feedbackText,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
