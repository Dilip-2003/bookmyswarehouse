import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: ProfileAppBar(text: 'About Us'),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.04,
        ),
        child: Text(
          'As AI continues to advance, every aspect of customer interaction within businesses will undergo significant transformation. We believe in harnessing this technology to seamlessly integrate into daily operations, creating a more immersive and human-centric experience for both customers and employees. Warehouse on Hire stands out as the pioneering AI-centric company designed for scalability, embedding AI throughout the enterprise journey. Our cutting-edge platform integrates voice, video, text, and data into a unified ecosystem, powered by Generative AI, Knowledge AI, Emotion AI, and workflow automation. Acting as a trusted co-pilot, we leverage these technologies to enhance customer and employee experiences, making Warehouse on Hire the driving force behind the most captivating interactions in the world of business.',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: BasicColor.deepBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
