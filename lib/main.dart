import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/api_service/app_binding.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/view/splash_screen.dart';

void main()async {
  await GetStorage.init(); // Ensure GetStorage is initialized

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ).copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: primaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
