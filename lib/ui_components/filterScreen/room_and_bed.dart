import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomAndBed extends StatelessWidget {
  const RoomAndBed({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowData(
          title: 'Cabins',
        ),
        ShowData(
          title: 'Bathrooms',
        ),
        ShowData(
          title: 'Storage Units',
        ),
        ShowData(
          title: 'Drawing Rooms',
        ),
      ],
    );
  }
}

class ShowData extends StatefulWidget {
  ShowData({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  int countValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 0.02,
              color: Color(0xFF7D7F88),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (countValue > 0) {
                      countValue--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 20,
                ),
              ),
              Text(
                '$countValue',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 0.02,
                    color: Color(0xFF7D7F88),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    countValue++;
                  });
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
