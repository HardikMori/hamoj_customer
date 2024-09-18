import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamoj/components/my_button.dart';
import 'package:hamoj/components/my_textfield.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/controller/sign_contoller.dart';
import 'package:hamoj/utils/image_contants.dart';
import 'package:hamoj/view/login_screen.dart';
import 'package:hamoj/view/main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignInController signInController = Get.find();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signInController.mobileController.clear();
    signInController.nameController.clear();
    signInController.officeController.clear();
    signInController.passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // toolbarHeight: 0,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width * screenHorizontalPadding),
          child: SingleChildScrollView(
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
                      )
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
                        title: 'Office Number',
                        textInputType: TextInputType.phone,
                        bottomMargin: 6,
                        controller: signInController.officeController,
                      ),
                      MyTextField(
                        title: 'Name',
                        bottomMargin: 6,
                        controller: signInController.nameController,
                      ),
                      MyTextField(
                        title: 'Mobile Number',
                        textInputType: TextInputType.phone,
                        bottomMargin: 6,
                        controller: signInController.mobileController,
                      ),
                      MyTextField(
                        controller: signInController.passwordController,
                        title: 'Password',
                        obscureText: true,
                        bottomMargin: 6,
                      ),
                      SizedBox(
                        height: height * 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: MyButton(
                                  title: 'Submit',
                                  onTap: () {
                                    var body = {

                                      "office_No": signInController.officeController.text,
                                      "name": signInController.nameController.text,
                                      "email": "string",
                                      "mobile": signInController.mobileController.text,
                                      "password": signInController.passwordController.text
                                    };
                                    signInController.SiginApiCall(body: body);
                                    // Navigator.pushAndRemoveUntil(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const LoginScreen(),
                                    //   ),
                                    //   (route) => false,
                                    // );
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
