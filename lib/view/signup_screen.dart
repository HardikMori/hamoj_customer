import 'package:flutter/material.dart';
import 'package:hamoj/components/my_button.dart';
import 'package:hamoj/components/my_textfield.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/view/main_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Scaffold(
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
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(pinkLogo),
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
                ),
                MyTextField(
                  title: 'Name',
                  bottomMargin: 6,
                ),
                MyTextField(
                  title: 'Mobile Number',
                  textInputType: TextInputType.phone,
                  bottomMargin: 6,
                ),
                MyTextField(
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            })),
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
