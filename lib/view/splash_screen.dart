import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/controller/splash_controller.dart';
import 'package:hamoj/utils/image_contants.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 final  controller = Get.find<SplashController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.routing();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: height * 180,
                fit: BoxFit.cover,
                image: const AssetImage(
                  ImageConstants.whiteLogo,
                ),
              ),
            ],
          ),
        ));
  }
}
