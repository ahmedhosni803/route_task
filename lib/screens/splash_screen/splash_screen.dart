import 'dart:async';

import "package:animated_text_kit/animated_text_kit.dart";
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:route_task/screens/home_screen/home_screen.dart';

import '../../providers/home_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).getUsersAndPosts();
    });
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextLiquidFill(
          loadDuration: const Duration(seconds: 2),
          waveDuration: const Duration(seconds: 2),
          text: 'Route',
          waveColor: const Color(0xff5D9CEC),
          boxBackgroundColor: const Color(0xff060E1E),
          textStyle: TextStyle(
            fontSize: 60.dp,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300),
    ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
