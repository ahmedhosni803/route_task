import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.network(
            "https://lottie.host/30dd2569-1512-4b4f-8546-b2532dbc0afe/WVgmc66fPm.json",
            width: 70.w,
            fit: BoxFit.cover),
        SizedBox(
          height: 1.h,
        ),
        Text("Try later",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 25.dp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily)),
      ],
    ));
  }
}
