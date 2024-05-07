import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/chat/pages/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({Key? key}) : super(key: key);

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
                    ' Rajesh Kumar',
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
                      MaterialPageRoute(
                        builder: (context) => ChatRoom(
                          name: 'Rajesh Kumar',
                        ),
                      ),
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
                    _callNumber('9064364294');
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
