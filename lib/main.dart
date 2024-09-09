import 'package:flutter/material.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ).copyWith(
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: primaryColor,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
