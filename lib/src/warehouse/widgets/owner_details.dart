import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/chat/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class OwnerDetails extends StatefulWidget {
  OwnerDetails({
    Key? key,
    required this.ownerName,
    required this.ownerPhone,
  }) : super(key: key);
  final String ownerName, ownerPhone;
  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: width * 0.14,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.asset(
                  'assets/images/owner_img.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.ownerName,
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, color: BasicColor.lightBlack),
                    ),
                  ),
                  Text(
                    ' Property owner',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14, color: Color(0xFF7D7F88)),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: BasicColor.deepWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFE3E3E7),
                      )
                    ]),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  icon: const Icon(Icons.message_rounded),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: BasicColor.deepWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFE3E3E7),
                      )
                    ]),
                child: IconButton(
                  onPressed: () {
                    _callNumber(widget.ownerPhone);
                  },
                  icon: const Icon(Icons.call_rounded),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Function to call a number
  void _callNumber(String phoneNumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      print('Error calling phone number: $e');
    }
  }
}
