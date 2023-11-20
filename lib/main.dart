import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:route_task/providers/home_provider.dart';
import 'package:route_task/theme.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      builder: (context, child) => FlutterSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Social App',
            theme: AppTheme.primaryTheme,
            themeMode: ThemeMode.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

extension X<T> on List<T> {
  int getCount(element) {
    int count = 0;
    forEach((e) {
      if (e == element) {
        count++;
      }
    });
    return count;
  }
}
