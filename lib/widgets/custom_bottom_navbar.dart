import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/constants/textstyle/bottom_navbar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool isFill1 = false;
  bool isFill2 = false;
  bool isFill3 = false;
  bool isFill4 = false;
  bool isFill5 = false;
  @override
  void initState() {
    super.initState();
    isFill1 = true;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2.0,
      color: const Color(0xFFFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );
                setState(() {
                  isFill1 = !isFill1;
                  isFill2 = false;
                  isFill3 = false;
                  isFill4 = false;
                  isFill5 = false;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                    color:
                        isFill1 ? BasicColor.primary : const Color(0xFF7D8588),
                  ),
                  Text(
                    'Home',
                    style: BottomNavbar.bottomNavbar1(
                        isFill1 ? BasicColor.primary : const Color(0xFF7D8588)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isFill2 = !isFill2;
                  isFill1 = false;
                  isFill3 = false;
                  isFill4 = false;
                  isFill5 = false;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.signpost_outlined,
                    size: 30,
                    color:
                        isFill2 ? BasicColor.primary : const Color(0xFF7D8588),
                  ),
                  Text(
                    'Explore',
                    style: BottomNavbar.bottomNavbar1(
                        isFill2 ? BasicColor.primary : const Color(0xFF7D8588)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ChatScreen(),
                //     ));
                setState(() {
                  isFill3 = !isFill3;
                  isFill2 = false;
                  isFill1 = false;
                  isFill4 = false;
                  isFill5 = false;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.message_rounded,
                    size: 30,
                    color:
                        isFill3 ? BasicColor.primary : const Color(0xFF7D8588),
                  ),
                  Text(
                    'Chat',
                    style: BottomNavbar.bottomNavbar1(
                        isFill3 ? BasicColor.primary : const Color(0xFF7D8588)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isFill4 = !isFill4;
                  isFill2 = false;
                  isFill3 = false;
                  isFill1 = false;
                  isFill5 = false;
                });
              },
              child: Column(
                children: [
                  Icon(
                    isFill4 ? Icons.favorite : Icons.favorite_border,
                    size: 30,
                    color:
                        isFill4 ? BasicColor.primary : const Color(0xFF7D8588),
                  ),
                  Text(
                    'Saved',
                    style: BottomNavbar.bottomNavbar1(
                        isFill4 ? BasicColor.primary : const Color(0xFF7D8588)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isFill5 = !isFill5;
                  isFill2 = false;
                  isFill3 = false;
                  isFill4 = false;
                  isFill1 = false;
                });
              },
              child: Column(
                children: [
                  Icon(
                    isFill5 ? Icons.person_2_rounded : Icons.person_2_outlined,
                    size: 30,
                    color:
                        isFill5 ? BasicColor.primary : const Color(0xFF7D8588),
                  ),
                  Text(
                    'Profile',
                    style: BottomNavbar.bottomNavbar1(
                        isFill5 ? BasicColor.primary : const Color(0xFF7D8588)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
