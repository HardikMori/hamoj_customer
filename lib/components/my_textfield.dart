import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.title,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.bottomMargin = 12,
    this.controller
  });

  String title;
  TextInputType textInputType;
  bool obscureText;
  double bottomMargin;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff878787),
            fontSize: width * 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: width * 15,
            ),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: height * bottomMargin,
        ),
      ],
    );
  }
}
