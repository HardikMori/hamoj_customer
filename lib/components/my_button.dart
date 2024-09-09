import 'package:flutter/material.dart';
import 'package:hamoj/constants.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.title, required this.onTap});

  String title;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 12,
          horizontal: width * 16,
        ),
        // width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          border: Border.all(
            color: Color(0xff878787).withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(
            width * 4,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: width * 16,
            ),
          ),
        ),
      ),
    );
  }
}
