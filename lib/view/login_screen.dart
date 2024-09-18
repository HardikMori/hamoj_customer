import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/controller/login_controller.dart';
import 'package:hamoj/utils/image_contants.dart';
import 'package:hamoj/view/signup_screen.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    // final fKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Scaffold(
        resizeToAvoidBottomInset: false,

        body: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * screenHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 24,
              horizontal: width * 16,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: width * 3,
                  spreadRadius: width * 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(ImageConstants.pinkLogo),
                  width: width * 140,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 24,
                  ),
                ),
                SizedBox(
                  height: height * 48,
                ),
                MyTextField(
                  title: 'Mobile Number',
                  controller: controller.mobileController,
                  textInputType: TextInputType.phone,
                ),
                MyTextField(
                  title: 'Password',
                  controller: controller.pwdController,
                  obscureText: true,
                ),
                SizedBox(
                  height: height * 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyButton(
                        title: 'Login',
                        onTap: () {
                          controller.loginApiCall(
                            body: {
                              "mobileNumber": controller.mobileController.text,
                              "password": controller.pwdController.text,
                              "isVendor": true
                            }
                          );


                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MainScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: width * 32,
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Sign Up',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
